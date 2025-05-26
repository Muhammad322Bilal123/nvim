
vim.o.completeopt = "menuone,noselect"

-- Load LSP config
local lspconfig = require("lspconfig")

-- Setup Pyright
lspconfig.pyright.setup{}

-- Enable completion using LSP omnifunc
vim.cmd [[
  autocmd FileType python setlocal omnifunc=v:lua.vim.lsp.omnifunc
]]

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup Pyright
lspconfig.pyright.setup({
  capabilities = capabilities,
})

require('lspconfig').pyright.setup{
  settings = {
    python = {
      pythonPath = "/home/biiiiai/Desktop/AI_prac/venv/venv/bin/python3"
    }
  }
}

