-- lua/plugin/core/code_action.lua
return function()
  local null_ls = require("null-ls")
  return {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.autoflake,
    null_ls.builtins.diagnostics.flake8,
  }
end

