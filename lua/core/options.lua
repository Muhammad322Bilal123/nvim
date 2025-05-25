local opt = vim.opt

-- Enable true color support
opt.termguicolors = true

-- Use global statusline instead of per-window
opt.laststatus = 3

-- Command line height zero (compact command line)
opt.cmdheight = 0
vim.cmd [[autocmd CmdlineLeave * redraw]]

-- Fillchars to remove vertical lines, end-of-buffer tildes etc
opt.fillchars = {
  vert = " ",
  eob = " ",
  fold = " ",
  horiz = " ",
  horizup = " ",
  horizdown = " ",
  vertleft = " ",
  vertright = " ",
  verthoriz = " ",
}

-- Line wrapping similar to VS Code
opt.wrap = true
opt.linebreak = true
opt.showbreak = "↪  "
opt.breakindent = true
opt.breakindentopt = "shift:2,min:20"
opt.whichwrap = "b,s,<,>,[,],h,l"

-- Persistent undo
opt.undofile = true
opt.undodir = vim.fn.stdpath("config") .. "/undo"

-- GUI font for Neovide (JetBrainsMono Nerd Font, size 11)
vim.o.guifont = "JetBrainsMono Nerd Font Mono:h11:style=Regular"

-- Neovide font options
vim.g.neovide_font_antialias = true
vim.g.neovide_font_autohint = false
vim.g.neovide_font_hinting = "Full"
vim.g.neovide_font_features = {}

-- Session options
vim.o.sessionoptions = "buffers,curdir,tabpages,winsize,help,globals,skiprtp,folds,localoptions"
