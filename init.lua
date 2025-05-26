-- Set leader key to space
vim.g.mapleader = " "
vim.opt.termguicolors = true



-- Auto-install lazy.nvim plugin manager if missing
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end

vim.opt.rtp:prepend(lazypath)

-- Setup plugins via lazy.nvim
require("lazy").setup(require("plugin.core"))

-- Load core options, autocommands, mappings, debug config
require("core.options")
require("core.autocmds")
require("mapping")
require("core.ui")
require("core.diagnostics").setup()
require("core.diagnostics_sign")
require("core.diagnostics_autocmds").setup()
require("core.diagnostics_keymaps").setup()
require("core.debugy").setup()

-- Load VSCode-style snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Show absolute line numbers
vim.opt.number = true           
vim.opt.relativenumber = true  -- Show relative numbers (optional, helpful for navigation)


vim.g.python3_host_prog = '/home/biiiiai/Desktop/AI_prac/venv/venv/bin/python3'


