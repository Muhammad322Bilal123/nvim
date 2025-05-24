-- Load and apply colorscheme

require('onedark').setup {
  transparent = false,  -- Make sure this is false, not true
}
require('onedark').load()
vim.cmd("colorscheme onedark")

