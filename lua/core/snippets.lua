local M = {}

function M.setup()
  local luasnip = require('luasnip')

  -- Load snippets from friendly-snippets
  require("luasnip.loaders.from_vscode").lazy_load()

  -- Optional: some basic configuration
  luasnip.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
  }
end

return M

