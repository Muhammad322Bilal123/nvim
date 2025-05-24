require("nvim-tree").setup({
  sort_by = "name",
  view = {
    width = 30,
    side = "right",
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  renderer = {
    highlight_git = true,
    root_folder_modifier = ":t",
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        item = "│ ",
        none = "  ",
      },
    },
    indent_width = 0,
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

-- Make nvim-tree background transparent by setting these highlight groups
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

