-- Auto save on leaving insert mode or when text changes
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modified then  -- only save if buffer is modified
      vim.cmd("silent write")
    end
  end,
})

