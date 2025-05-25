
local null_ls = require("null-ls")

-- You can register sources here (formatters, linters, code actions, etc)
null_ls.setup({
  sources = {
    -- Formatters
    null_ls.builtins.formatting.prettier,   -- JS/TS/JSON etc
    null_ls.builtins.formatting.black,      -- Python

    -- Linters
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.flake8,

    -- Code actions
    null_ls.builtins.code_actions.gitsigns,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      -- Format on save
      vim.api.nvim_clear_autocmds({ group = 0, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = 0,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
