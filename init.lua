vim.g.mapleader = " "
vim.opt.fillchars:append { vert = " " }


vim.o.sessionoptions = "buffers,curdir,tabpages,winsize,help,globals,skiprtp,folds,localoptions"

-- Load all core modules
require("core.plugins")      -- Packer and plugin definitions
require("core.settings")     -- Vim options like number, tab settings
require("core.mapping")      -- Keybindings
require("core.colorscheme")  -- Theme
require("core.lsp")          -- LSP config
require("plugins.nvimtree")   -- Neotree
require("plugins.harpoon")   -- Harpoon
require("plugins.feline")
require("core.statusline")
require("core.providers")
require("core.components")
require("core.autosave")
require("plugins.cmp")
require("plugins.alpha")
require("core.diagnostics_sign").setup()
require("plugins.indentline")
require('core.debugy').setup()
require("core.diagnostics").setup()
require("core.diagnostics_autocmds").setup()
require('core.diagnostics_keymaps').setup()
require('core.snippets').setup()
require'lspconfig'.pyright.setup{}
require("lsp.python_format_lint")

--require("plugins.dap_python").setup()
--require("core.dap_python")
--require('core.dap_keymaps')
require("luasnip.loaders.from_vscode").lazy_load()





vim.opt.laststatus = 3
vim.opt.cmdheight = 0
vim.cmd [[autocmd CmdlineLeave * redraw]]


vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0


-- Remove ~ at end of buffer and vertical separators between splits
vim.opt.fillchars = {
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

-- Enable visual line wrapping like VS Code
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "↪  "
vim.opt.breakindent = true
vim.opt.breakindentopt = "shift:2,min:20"
vim.opt.whichwrap = "b,s,<,>,[,],h,l"

-- Set up text width and ruler via autocmd
vim.api.nvim_create_autocmd({ "BufWinEnter", "FileType" }, {
  pattern = "*",
  callback = function()
    vim.wo.wrap = true
    vim.bo.textwidth = 80
    --vim.wo.colorcolumn = ""
  end,
})

-- Transparent splits and highlights
vim.cmd [[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight VertSplit guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
]]


-- core/providers.lua or your config init

vim.api.nvim_set_hl(0, "StatusLineModeNormal", { fg = "#93C5FD", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "StatusLineModeInsert", { fg = "#60A5FA", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "StatusLineModeVisual", { fg = "#3B82F6", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "StatusLineModeReplace", { fg = "#EF4444", bg = "none", bold = true })  -- red text only
vim.api.nvim_set_hl(0, "StatusLineModeCommand", { fg = "#8B5CF6", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "StatusLineModeTerminal", { fg = "#FBBF24", bg = "none", bold = true })

-- For file info and position etc. — lighter blue text, transparent bg
vim.api.nvim_set_hl(0, "StatusLineBlueFG", { fg = "#93C5FD", bg = "none" })

vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", ctermbg = "NONE" })

vim.api.nvim_set_hl(0, "StatusLineModeNormal", { fg = "#93C5FD", bg = "NONE", ctermbg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "StatusLineModeInsert", { fg = "#60A5FA", bg = "NONE", ctermbg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "StatusLineModeVisual", { fg = "#3B82F6", bg = "NONE", ctermbg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "StatusLineModeReplace", { fg = "#EF4444", bg = "NONE", ctermbg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "StatusLineModeCommand", { fg = "#8B5CF6", bg = "NONE", ctermbg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "StatusLineModeTerminal", { fg = "#FBBF24", bg = "NONE", ctermbg = "NONE", bold = true })

vim.api.nvim_set_hl(0, "StatusLineBlueFG", { fg = "#93C5FD", bg = "NONE", ctermbg = "NONE" })


vim.cmd [[
  highlight WinSeparator guifg=NONE guibg=NONE
]]


vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    local ft = vim.bo.filetype
    local sidebar_fts = { "NvimTree", "neo-tree", "Outline", "undotree", "packer", "toggleterm" }
    if vim.tbl_contains(sidebar_fts, ft) then
      vim.wo.colorcolumn = ""
    end
  end
})

vim.o.guifont = "JetBrainsMono Nerd Font Mono:h11:style=Regular"

vim.g.neovide_font_antialias = true
vim.g.neovide_font_autohint = false
vim.g.neovide_font_hinting = "Full"
vim.g.neovide_font_features = {}



vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo"

vim.opt.termguicolors = true


--vim.g.undotree_WindowLayout = 2  -- horizontal split at bottom
--vim.g.undotree_SplitHeight = 10  -- height of split in lines

-- Open terminal in horizontal split with 15 lines height
vim.api.nvim_set_keymap('n', '<leader>te', ':belowright split | resize 12 | terminal<CR>', { noremap = true, silent = true })



