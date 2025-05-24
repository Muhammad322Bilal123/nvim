
-- core/statusline.lua

local components = require('core.components')

require('feline').setup({
  components = components,
  theme = {
    fg = '#ffffff',
    bg = 'none',
  },
  vi_mode_colors = {
    NORMAL = 'cyan',
    INSERT = 'green',
    VISUAL = 'yellow',
    REPLACE = 'red',
    COMMAND = 'magenta',
    TERMINAL = 'orange',
  },
  force_inactive = {
    filetypes = {},
    buftypes = {},
    bufnames = {},
  },
})
