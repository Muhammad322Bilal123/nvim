-- Auto save on leaving insert mode or when text changes
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = "*",
  callback = function()
    -- Only save if buffer is modified AND it's a normal file buffer
    if vim.bo.modified and vim.bo.buftype == "" then
      vim.cmd("silent write")
    end
  end,
})

