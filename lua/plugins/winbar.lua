local M = {}

-- Show just filename with modified dot
local function get_filename()
  local filename = vim.fn.expand('%:t')
  if filename == '' then
    return '[No Name]'
  end
  local modified = vim.bo.modified and ' ●' or ''
  return '📄 ' .. filename .. modified
end

-- This sets winbar text on the current buffer
local function set_winbar()
  local bt = vim.api.nvim_get_option_value("buftype", { buf = 0 })
  if bt == "" then -- skip special buffers
    vim.opt_local.winbar = get_filename()
  else
    vim.opt_local.winbar = nil
  end
end

-- Public setup function
function M.setup()
  vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "BufWritePost", "TextChanged" }, {
    callback = set_winbar,
  })
end

return M


