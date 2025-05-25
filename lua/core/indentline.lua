-- File: lua/plugins/indentline.lua



-- Setup for indent-blankline.nvim
require("ibl").setup {
  indent = {
    char = "│",          -- vertical line character like VS Code
    smart_indent_cap = true,  -- intelligently caps lines at correct level
  },
  scope = {
    enabled = true,              -- show active scope line
    show_start = true,           -- mark the start of current scope
    show_end = true,             -- mark the end of current scope
    highlight = { "Function", "Label" }, -- use Treesitter captures for color
  },
  whitespace = {
    remove_blankline_trail = true,  -- clean up trailing indent guides
  },
}



