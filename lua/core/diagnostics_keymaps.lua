-- lua/config/diagnostics.lua
local M = {}

-- Toggles the diagnostic floating window
local function toggle_diagnostic_float()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= "" then
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].buftype == "nofile" then
        vim.api.nvim_win_close(win, true)
        return
      end
    end
  end
  vim.diagnostic.open_float(nil, { border = "rounded" })
end

function M.setup()
  local opts = { noremap = true, silent = true }

  -- Diagnostic keymaps
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>ll', toggle_diagnostic_float, opts)
  vim.keymap.set('n', '<leader>qqq', vim.diagnostic.setloclist, opts)
end

-- Save original handler to wrap it
local orig_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]

-- Override LSP diagnostic handler to filter duplicates
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
  if not result then
    -- No diagnostics, just call original handler
    return orig_handler(err, result, ctx, config)
  end

  local diagnostics = result.diagnostics
  local seen = {}
  local filtered = {}

  for _, diag in ipairs(diagnostics) do
    if diag.message and diag.message ~= "" then
      -- Compose a unique key for deduplication
      local key = diag.message .. (diag.severity or "") .. (diag.range and diag.range.start.line or "")
      if not seen[key] then
        seen[key] = true
        table.insert(filtered, diag)
      end
    end
  end

  -- Configure diagnostics display options
  vim.diagnostic.config({
    virtual_text = false,  -- disable inline text
    signs = true,          -- show signs in gutter
    underline = true,
    update_in_insert = true,
    severity_sort = true,
  })

  vim.api.nvim_create_autocmd({"DiagnosticChanged"}, {
    callback = function()
      vim.diagnostic.setloclist({ open = false })  -- update loclist silently
    end,
  })
  

  -- Replace diagnostics with filtered list
  result.diagnostics = filtered

  -- Call original handler
  orig_handler(err, result, ctx, config)
end

return M
