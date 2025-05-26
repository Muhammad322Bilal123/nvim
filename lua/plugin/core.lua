return {
  -- Lazy manages itself
  { "folke/lazy.nvim", version = "*" },

  -- Utilities
  { "mbbill/undotree" },
  { "ThePrimeagen/harpoon", dependencies = { "nvim-lua/plenary.nvim" }, config = function() require("core.harpoon") end },

  -- Debugging
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
  { "theHamsta/nvim-dap-virtual-text" },

  -- Session management
  {
    "rmagatti/auto-session",
    config = function() require("core.autosave") end,
  },

  -- Statusline (Feline)
  {
    "feline-nvim/feline.nvim",
    config = function() require("core.feline") end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("core.nvimtree") end,
  },

  -- Dashboard
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("core.alpha") end,
  },

  -- Theme Rose Pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("core.colorscheme")
    end,
  },

  -- Snippets and completion
  { "L3MON4D3/LuaSnip", version = "v1.*", config = function() require("core.snippets").setup() end },
  { "rafamadriz/friendly-snippets" },
  { "hrsh7th/nvim-cmp", config = function() require("core.cmp") end },
  { "hrsh7th/cmp-nvim-lsp" },
  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "onsails/lspkind-nvim" },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup({}) end,
  },

  -- ✅ Merged LSP & Tooling (no extra return!)
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('core.lsp')
      require('lspconfig').pyright.setup{
        settings = {
          python = {
            pythonPath = "/home/biiiiai/Desktop/AI_prac/venv/venv/bin/python3"
          }
        }
      }
    end,
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Null-ls for formatting, diagnostics, and code actions

  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("core.null-ls") -- or wherever your config is
    end,
  },
  
  


  -- Indentation guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function() require("core.indentline") end,
  },

  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("gitsigns").setup() end,
  },

  -- Neotest support
  { "nvim-neotest/nvim-nio" },
}
   
