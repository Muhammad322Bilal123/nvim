
local lspconfig = require("lspconfig")
local lsp_signature = require("lsp_signature")
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
  -- Attach lsp_signature to the buffer
  lsp_signature.on_attach({}, bufnr)

  -- Attach navic if the server supports document symbols
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

  -- You can add other keymaps or buffer-specific setups here
end

-- Setup your LSP servers with this single on_attach
lspconfig.pyright.setup({
  on_attach = on_attach,
  settings = {
    python = {
      pythonPath = "/home/biiiiai/Desktop/AI_prac/venv/venv/bin/python3",
    },
  },
})

-- Optional: highlight groups for signature window border
vim.cmd([[
  highlight! link LspSignatureActiveParameter Search
  highlight! FloatBorder guifg=#89B4FA guibg=NONE
]])
