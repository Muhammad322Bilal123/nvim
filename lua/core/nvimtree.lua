
require("nvim-tree").setup({
  sort_by = "name",
  view = {
    width = 30,
    --preserve_window_proportions = true,
    side = "right",
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  renderer = {
    highlight_git = true,
    root_folder_modifier = ":t",
    indent_markers = {
      enable = false,
      inline_arrows = true,
    },
    indent_width = 0,
    icons = {
      show = {
        folder = true,
      },
      glyphs = {
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  git = {
    enable = true,
    ignore = false,
  },
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
    },
  },
  filters = {
    dotfiles = false,
    custom = {".git", "node_modules", ".cache"},
  },
})

vim.cmd [[
  highlight NvimTreeNormal guibg=NONE ctermbg=NONE
  highlight NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE
  highlight NvimTreeFolderName guifg=#ffffff ctermfg=16
  highlight NvimTreeFile guifg=#ffffff ctermfg=16
  highlight NvimTreeFolderIcon guifg=#6495ED ctermfg=67
]]

vim.cmd [[ 
  augroup NvimTreeTransparency
    autocmd!
    autocmd FileType NvimTree highlight NvimTreeNormal guibg=NONE ctermbg=NONE
    autocmd FileType NvimTree highlight NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE
    autocmd FileType NvimTree highlight Normal guibg=NONE ctermbg=NONE
    autocmd FileType NvimTree highlight EndOfBuffer guibg=NONE ctermbg=NONE
    autocmd FileType NvimTree highlight SignColumn guibg=NONE ctermbg=NONE
  augroup END
]]
