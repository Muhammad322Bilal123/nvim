local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.flake8.with({
      command = "/home/biiiiai/.local/share/nvim/mason/bin/flake8",
    }),
  },

  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      -- Create or get the autocmd group first
      local group = vim.api.nvim_create_augroup("Format", { clear = true })

      -- Clear existing autocmds in this group for this buffer
      vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })

      -- Create autocmd to format buffer before saving
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})

vim.keymap.set("n", "<leader>fff", function()
  vim.lsp.buf.format()
end, { desc = "Format buffer with LSP" })

