
local M = {}

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
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>ll', toggle_diagnostic_float, opts)
  vim.keymap.set('n', '<leader>qqq', vim.diagnostic.setloclist, opts)
end

-- Save original handler so we can call it after filtering
local orig_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]

vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
  local diagnostics = result.diagnostics
  local seen = {}
  local filtered = {}

  for _, diag in ipairs(diagnostics) do
    if diag.message and diag.message ~= "" then
      -- Uncomment and adjust if you want severity filtering:
      -- local min_severity = vim.diagnostic.severity.WARN
      -- if diag.severity and diag.severity <= min_severity then

      local key = diag.message .. diag.severity .. diag.range.start.line
      if not seen[key] then
        seen[key] = true
        table.insert(filtered, diag)
      end
      -- end
    end
  end

  vim.diagnostic.config({
  virtual_text = false,  -- disables inline error messages
  signs = true,          -- keep error signs (the 'x' marks)
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})


  result.diagnostics = filtered
  orig_handler(err, result, ctx, config)
end

return M
