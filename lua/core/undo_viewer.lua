
local M = {}

local undotree = vim.fn.undotree

-- Save current buffer lines to restore after preview
local function save_current_buffer()
  return vim.api.nvim_buf_get_lines(0, 0, -1, false)
end

-- Set current buffer lines from snapshot (restore original buffer)
local function set_buffer_lines(lines)
  vim.api.nvim_buf_set_option(0, "modifiable", true)
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(0, "modifiable", false)
end

-- Get buffer lines for undo seq by switching undo states (returns lines)
local function get_undo_lines(seq)
  local ok, _ = pcall(vim.cmd, "undo " .. seq)
  if not ok then
    return nil
  end
  return vim.api.nvim_buf_get_lines(0, 0, -1, false)
end

-- Compute a simple diff between two sets of lines (old_lines, new_lines)
-- Returns a table of diff lines with + or - prefix
local function compute_diff(old_lines, new_lines)
  local diff_lines = {}
  local max_lines = math.max(#old_lines, #new_lines)
  for i = 1, max_lines do
    local old_line = old_lines[i]
    local new_line = new_lines[i]
    if old_line ~= new_line then
      if old_line then
        table.insert(diff_lines, "- " .. old_line)
      end
      if new_line then
        table.insert(diff_lines, "+ " .. new_line)
      end
    else
      table.insert(diff_lines, "  " .. (old_line or ""))
    end
  end
  return diff_lines
end

function M.show()
  local tree = undotree()
  local entries = tree.entries or {}

  if #entries == 0 then
    print("No undo history found.")
    return
  end

  local left_lines = { "Undo History (Current → Oldest)" }
  for i = #entries, 1, -1 do
    local entry = entries[i]
    local line = string.format(
      "[%3d] Seq: %d | Time: %s",
      i,
      entry.seq,
      os.date("%Y-%m-%d %H:%M:%S", entry.time)
    )
    table.insert(left_lines, line)
  end

  local left_buf = vim.api.nvim_create_buf(false, true)
  local right_buf = vim.api.nvim_create_buf(false, true)

  -- Setup left buffer (undo list)
  vim.api.nvim_buf_set_lines(left_buf, 0, -1, false, left_lines)
  vim.api.nvim_buf_set_option(left_buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(left_buf, "modifiable", false)

  -- Setup right buffer (diff preview)
  vim.api.nvim_buf_set_lines(right_buf, 0, -1, false, { "Select an undo entry to preview diff..." })
  vim.api.nvim_buf_set_option(right_buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(right_buf, "modifiable", false)

  local width = math.floor(vim.o.columns * 0.45)
  local height = math.min(#left_lines + 2, math.floor(vim.o.lines * 0.6))
  local row = math.floor((vim.o.lines - height) / 2)
  local col_left = math.floor((vim.o.columns - width * 2 - 3) / 2)
  local col_right = col_left + width + 3

  local left_win = vim.api.nvim_open_win(left_buf, true, {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col_left,
    border = "rounded",
  })

  local right_win = vim.api.nvim_open_win(right_buf, false, {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col_right,
    border = "rounded",
  })

  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

  local close_both = function()
    if vim.api.nvim_win_is_valid(left_win) then
      vim.api.nvim_win_close(left_win, true)
    end
    if vim.api.nvim_win_is_valid(right_win) then
      vim.api.nvim_win_close(right_win, true)
    end
  end

  vim.keymap.set("n", "q", close_both, { buffer = left_buf, silent = true, noremap = true })
  vim.keymap.set("n", "q", close_both, { buffer = right_buf, silent = true, noremap = true })

  -- Save current buffer lines and window before starting preview
  local original_lines = save_current_buffer()
  local original_win = vim.api.nvim_get_current_win()

  local function update_preview(line_num)
    local idx = #entries - (line_num - 2)
    if idx < 1 or idx > #entries then
      return
    end
    local seq = entries[idx].seq

    -- Get undo state lines
    local undo_lines = get_undo_lines(seq)
    if not undo_lines then
      vim.api.nvim_buf_set_option(right_buf, "modifiable", true)
      vim.api.nvim_buf_set_lines(right_buf, 0, -1, false, {"Failed to get undo state"})
      vim.api.nvim_buf_set_option(right_buf, "modifiable", false)
      return
    end

    local diff = compute_diff(undo_lines, original_lines)

    vim.api.nvim_buf_set_option(right_buf, "modifiable", true)
    vim.api.nvim_buf_set_lines(right_buf, 0, -1, false, diff)
    vim.api.nvim_buf_set_option(right_buf, "modifiable", false)
  end

  -- Show first entry diff preview by default
  update_preview(2)

  vim.api.nvim_create_autocmd("CursorMoved", {
    buffer = left_buf,
    callback = function()
      local line = vim.api.nvim_win_get_cursor(left_win)[1]
      update_preview(line)
    end,
  })

  vim.keymap.set("n", "<CR>", function()
    local line = vim.api.nvim_win_get_cursor(left_win)[1]
    local idx = #entries - (line - 2)
    if idx < 1 or idx > #entries then return end
    local seq = entries[idx].seq
    local ok, err = pcall(vim.cmd, "undo " .. seq)
    if not ok then
      vim.api.nvim_echo({{"Failed to restore undo seq: " .. err, "ErrorMsg"}}, false, {})
      return
    end
    vim.api.nvim_echo({{"Restored undo sequence " .. seq, "None"}}, false, {})
    close_both()
  end, {buffer = left_buf, silent = true, noremap = true})

  -- Restore original buffer lines if still on the same buffer on close
  vim.api.nvim_create_autocmd("WinClosed", {
    once = true,
    callback = function()
      -- Wait a tick to avoid issues with buffer invalidation
      vim.schedule(function()
        local cur_buf = vim.api.nvim_get_current_buf()
        -- Only restore if still in original buffer (not inside undo viewer buffers)
        if cur_buf == vim.api.nvim_get_current_buf() then
          set_buffer_lines(original_lines)
          vim.api.nvim_set_current_win(original_win)
        end
      end)
    end,
  })
end

function M.setup()
  vim.opt.undofile = true
  local undodir = vim.fn.stdpath("config") .. "/undo"
  vim.opt.undodir = undodir
  if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
  end
end

return M
