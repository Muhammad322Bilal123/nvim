
local M = {}

function M.show()
  local tree = vim.fn.undotree()
  local entries = tree.entries or {}

  local lines = { "Undo Tree (Current → Oldest)" }
  for i = #entries, 1, -1 do
    local entry = entries[i]
    local preview = ""

    -- Try getting current buffer line for preview (contextual, not historical)
    local ok, line_num = pcall(vim.api.nvim_win_get_cursor, 0)
    if ok and type(line_num) == "table" then
      local current_line = vim.api.nvim_buf_get_lines(0, line_num[1] - 1, line_num[1], false)[1]
      preview = current_line and (" → " .. current_line:gsub("^%s+", "")) or ""
    end

    local line = string.format(
      "[%3d] Seq: %d | Time: %s%s",
      i,
      entry.seq,
      os.date("%Y-%m-%d %H:%M:%S", entry.time),
      preview
    )
    table.insert(lines, line)
  end

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(buf, "modifiable", false)

  local width = math.floor(vim.o.columns * 0.5)
  local height = math.min(#lines + 2, math.floor(vim.o.lines * 0.4))
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Apply transparent and rounded floating window
  vim.api.nvim_open_win(buf, true, {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    border = "rounded",
  })

  -- Apply transparency to the float
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

  vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
end

return M
