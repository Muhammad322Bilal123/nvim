-- This file sets up Packer and lists all plugins to be managed

-- Load packer if not loaded
vim.cmd [[packadd packer.nvim]]

-- Start defining plugins
require("packer").startup(function(use)
  -- Packer manages itself
  use "wbthomason/packer.nvim"
use {
  'neovim/nvim-lspconfig'
}
  -- Add this line to your packer.nvim plugin list and run :PackerSync
  use {
    'feline-nvim/feline.nvim',
    config = function()
      require('core.statusline')
    end,
  }


  use {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup{}
  end
}



  -- LSP and Autocompletion plugins (VS Code-like setup)
use 'neovim/nvim-lspconfig'           -- LSP support
use 'hrsh7th/nvim-cmp'                -- Autocompletion engine
use 'hrsh7th/cmp-nvim-lsp'            -- LSP source for nvim-cmp
use 'L3MON4D3/LuaSnip'                -- Snippet engine
use 'saadparwaiz1/cmp_luasnip'        -- LuaSnip source for nvim-cmp
use 'hrsh7th/cmp-buffer'              -- Buffer completion source
use 'hrsh7th/cmp-path'                -- Path completion source

use 'onsails/lspkind-nvim'     -- Adds vscode-like icons to cmp


use 'L3MON4D3/LuaSnip'            -- Snippet engine
use 'rafamadriz/friendly-snippets' -- Predefined snippets collection


 use 'mfussenegger/nvim-dap'
 
-- Initialize Mason plugin
use {
  "williamboman/mason.nvim",
  run = ":MasonUpdate", -- optional
  config = function()
    require("mason").setup()
  end
}


use {
  'lewis6991/gitsigns.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('gitsigns').setup()
  end
}




  -- LSP support
  use "neovim/nvim-lspconfig"

  -- In core.plugins or your plugin setup file
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}


  -- Completion plugins
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip"

  -- Treesitter for better syntax highlighting
  use {
    "nvim-treesitter/nvim-treesitter",
  }

   -- plenary.nvim: Utility functions used by many plugins
  use 'nvim-lua/plenary.nvim'

  -- Plugin for quick file marking and navigation
use {
  'ThePrimeagen/harpoon',
  requires = { 'nvim-lua/plenary.nvim' },  -- Dependency Harpoon needs
  config = function()
    require("plugins.harpoon")  -- Load harpoon config after install
  end,
}


  -- Telescope fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    requires = { "nvim-lua/plenary.nvim" }
  }

  -- File explorer
  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons"
  
  -- Neo Tree
use {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        mappings = {
          -- Custom mapping for diagnostics
          ["c"] = function()
            vim.diagnostic.open_float(nil, { focusable = true })
          end,
        },
      },
    })
  end,
}


 -- Color theme
  use "navarasu/onedark.nvim"
end)

