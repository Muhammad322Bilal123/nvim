local api = vim.api

-- Group for autocmds
local group = api.nvim_create_augroup("MyAutoCmds", { clear = true })

-- Enable wrap and set textwidth on BufWinEnter and FileType events
api.nvim_create_autocmd({ "BufWinEnter", "FileType" }, {
  group = group,
  pattern = "*",
  callback = function()
    vim.wo.wrap = true
    vim.bo.textwidth = 80
  end,
})

-- Clear colorcolumn in sidebar-like filetypes on window enter
api.nvim_create_autocmd("WinEnter", {
  callback = function()
    local ft = vim.bo.filetype
    local sidebar_fts = { "NvimTree", "neo-tree", "Outline", "undotree", "packer", "toggleterm" }
    if vim.tbl_contains(sidebar_fts, ft) then
      vim.wo.colorcolumn = ""
    end
  end,
})

-- Redraw after CmdlineLeave (fix glitches)
api.nvim_create_autocmd("CmdlineLeave", {
  pattern = "*",
  command = "redraw"
})
