
-- core/components.lua
-- Compose providers into active and inactive statusline sections

local providers = require('core.providers')

local M = {}

-- Active window statusline sections
M.active = {
  {
    providers.mode,
    providers.file_info,
  },
  {
    providers.git_branch,
    providers.diagnostics,
  },
  {
    providers.position,
    providers.progress,
  },
}

-- Inactive window statusline sections (simpler)
M.inactive = {
  {
    providers.file_info,
  },
  {},
  {},
}

return M
