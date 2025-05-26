-- lua/config/diagnostics_signs.lua
local M = {}

function M.setup()
  local signs = { Error = "", Warn = "", Hint = "", Info = "" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })  -- number column highlight
  end
end

return M
