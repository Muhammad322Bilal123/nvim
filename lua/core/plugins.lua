-- -- Load packer if not loaded
-- vim.cmd [[packadd packer.nvim]]

-- require("packer").startup(function(use)
--   -- Packer manages itself
--   use "wbthomason/packer.nvim"

--   -- Undo tree
--   use 'mbbill/undotree'

--   -- DAP core and UI
--   use 'mfussenegger/nvim-dap'
--   use {
--     "rcarriga/nvim-dap-ui",
--     requires = {"mfussenegger/nvim-dap"}
--   }
--   use 'theHamsta/nvim-dap-virtual-text' -- optional for inline debug info

--   -- Auto-session (only once)
--   use {
--     'rmagatti/auto-session',
--     config = function()
--       vim.o.sessionoptions = "buffers,curdir,tabpages,winsize,help,globals,skiprtp,folds,localoptions"
--       require("auto-session").setup({
--         log_level = "info",
--         auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
--         auto_session_enabled = true,
--         auto_save_enabled = true,
--         auto_restore_enabled = true,
--         auto_session_suppress_dirs = { "~/", "/" },
--       })
--     end
--   }

--   -- Statusline
--   use {
--     'feline-nvim/feline.nvim',
--     config = function()
--       require('core.statusline')
--     end,
--   }

--   -- Treesitter & related
--   use {
--     'nvim-treesitter/nvim-treesitter',
--   }
--   use {
--     'nvim-tree/nvim-tree.lua',
--     requires = { 'nvim-tree/nvim-web-devicons' }
--   }
--   use {
--     "goolord/alpha-nvim",
--     requires = { "nvim-tree/nvim-web-devicons" },
--     config = function()
--       require("alpha").setup(require("alpha.themes.dashboard").config)
--     end
--   }
--   use {
--     "L3MON4D3/LuaSnip",
--     tag = "v1.*",
--     config = function()
--       require("luasnip.loaders.from_vscode").lazy_load()
--     end
--   }

--   -- Null-ls and none-ls
--   use {
--     "jose-elias-alvarez/null-ls.nvim",
--     requires = { "nvim-lua/plenary.nvim" },
--   }
--   use {
--     "nvimtools/none-ls.nvim",
--     requires = { "nvim-lua/plenary.nvim" },
--   }

--   -- Autopairs
--   use {
--     "windwp/nvim-autopairs",
--     config = function()
--       require("nvim-autopairs").setup{}
--     end,
--   }

--   -- LSP and completion
--   use 'neovim/nvim-lspconfig'
--   use 'hrsh7th/nvim-cmp'
--   use 'hrsh7th/cmp-nvim-lsp'
--   use 'saadparwaiz1/cmp_luasnip'
--   use 'hrsh7th/cmp-buffer'
--   use 'hrsh7th/cmp-path'
--   use 'onsails/lspkind-nvim'
--   use 'rafamadriz/friendly-snippets'

--   -- Mason
--   use {
--     "williamboman/mason.nvim",
--     run = ":MasonUpdate",
--     config = function()
--       require("mason").setup()
--     end,
--   }

--   -- Git signs
--   use {
--     'lewis6991/gitsigns.nvim',
--     requires = { 'nvim-lua/plenary.nvim' },
--     config = function()
--       require('gitsigns').setup()
--     end,
--   }

--   -- Lualine
--   use {
--     'nvim-lualine/lualine.nvim',
--     requires = { 'nvim-tree/nvim-web-devicons', opt = true },
--   }

--   -- Indent blankline
--   use {
--     "lukas-reineke/indent-blankline.nvim",
--     main = "ibl",
--     config = function()
--       require("ibl").setup {
--         indent = { char = "│" },
--         scope = {
--           enabled = true,
--           show_start = false,
--           show_end = false,
--           char = "│",
--         },
--       }
--     end,
--   }


-- use 'nvim-neotest/nvim-nio'

--   -- Harpoon
--   use {
--     'ThePrimeagen/harpoon',
--     requires = { 'nvim-lua/plenary.nvim' },
--     config = function()
--       require("plugins.harpoon")
--     end,
--   }

-- end)

-- -- 