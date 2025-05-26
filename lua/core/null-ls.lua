local null_ls = require("null-ls")

local flake8 = {
  name = "flake8",
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "python" },
  generator = null_ls.generator({
    command = vim.fn.stdpath("data") .. "/mason/bin/flake8",
    args = { "--format=%(row)d,%(col)d,%(code).1s,%(code)s: %(text)s", "-" },
    to_stdin = true,
    from_stderr = false,
    format = "raw",
    on_output = function(params)
      local items = {}
      for line in vim.gsplit(params.output, "\n") do
        local row, col, severity, code_message = line:match("^(%d+),(%d+),(%w),(.+)$")
        if row then
          table.insert(items, {
            row = tonumber(row),
            col = tonumber(col),
            message = code_message,
            severity = severity == "E" and 1 or 2,
            source = "flake8",
          })
        end
      end
      return items
    end,
  }),
}

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,
    flake8,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      local group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
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
