require("neo-tree").setup({
  close_if_last_window = true,
  popup_border_style = "none",
  enable_git_status = true,
  enable_diagnostics = true,
  default_component_configs = {
    indent = {
      with_markers = true,
      indent_size = 2,
      padding = 1,
      with_expanders = true,
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "ﰊ",
      default = "",
    },
    git_status = {
      symbols = {
        added = "",
        modified = "",
        deleted = "",
        renamed = "",
        untracked = "",
        ignored = "",
        unstaged = "",
        staged = "",
        conflict = "",
      },
    },
  },
   filesystem = {
    follow_current_file = true,
    use_libuv_file_watcher = false,
  },
  window = {
    position = "left",
    width = 28,          -- Set width smaller here
    border = "none",     -- Fix border option as string
    adjust_width_on_content = false, 
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["<space>"] = "toggle_node",
      ["<cr>"] = "open",
      ["S"] = "open_split",
      ["s"] = "open_vsplit",
      ["C"] = "close_node",
      ["R"] = "refresh",
      ["a"] = "add",
      ["d"] = "delete",
      ["r"] = "rename",
      ["q"] = "close_window",
    },
  },
  filesystem = {
    follow_current_file = true,
    use_libuv_file_watcher = true,
  },
})


vim.opt.fillchars = {
  vert = " ",
  horiz = " ",
  eob = " ",
  fold = " ",
}


vim.cmd [[
  highlight NeoTreeNormal guibg=NONE ctermbg=NONE
  highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE
  highlight NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
  highlight NeoTreeStatusLine guibg=NONE ctermbg=NONE
  highlight NeoTreeStatusLineNC guibg=NONE ctermbg=NONE
]]
