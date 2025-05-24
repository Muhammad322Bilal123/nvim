
-- lua/config/diagnostics_autocmds.lua
local M = {}

function M.setup()
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = 0,
    callback = function()
      vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
    end,
  })
end

return M
