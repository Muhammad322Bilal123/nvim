-- lua/config/diagnostics_autocmds.lua
local M = {}

function M.setup()
  -- Show diagnostic float window on CursorHold (when cursor stays idle)
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = 0,  -- current buffer only
    callback = function()
      -- Open diagnostic float without stealing focus, with rounded border
      vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
    end,
  })
end

return M
