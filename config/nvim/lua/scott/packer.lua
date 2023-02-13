-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- search stuff
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- theme
  use 'rmehri01/onenord.nvim'

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- highlighting
  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate"
  })
  use("nvim-treesitter/playground")
  use("nvim-treesitter/nvim-treesitter-context")

  -- lsp
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind-nvim'
  use {
      'williamboman/mason.nvim',
      requires = {
        'williamboman/mason-lspconfig.nvim'
      }
  }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use ({
      'glepnir/lspsaga.nvim',
      requires = { {"nvim-tree/nvim-web-devicons"} }
  })
  use 'simrat39/symbols-outline.nvim'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use({
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require("lsp_lines").setup()
    end,
  })

  -- git
  use 'TimUntersberger/neogit'
  use 'mbbill/undotree'
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function ()
      require"octo".setup()
    end
  }

  -- prime
  use 'ThePrimeagen/harpoon'
  use 'ThePrimeagen/git-worktree.nvim'

  -- formatting 
  use 'sbdchd/neoformat'

  -- notes
  use('mickael-menu/zk-nvim')

  -- life
  use({
    'kylechui/nvim-surround',
    config = function()
        require("nvim-surround").setup({})
    end
  })
  use({
    'windwp/nvim-autopairs',
    confg = function ()
        require("nvim-autopairs").setup({})
    end
  })

  use({
    'nvim-tree/nvim-web-devicons',
    config = function ()
        require("nvim-web-devicons").setup({})
    end
  })
  -- debugging
  use 'mfussenegger/nvim-dap'

  -- testing
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
      "markemmons/neotest-deno",
      "rouge8/neotest-rust",
      "nvim-neotest/neotest-go"
    },
    config = function ()
        require("neotest").setup({
            adapters = {
              require("neotest-jest"),
              require("neotest-deno"),
              require("neotest-rust"),
              require("neotest-go")
            },
        })
    end
  }

  -- monorepo
  use {
    'Equilibris/nx.nvim',
    requires = {
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        require("nx").setup {
            nx_cmd_root = 'pnpm nx',
        }
    end
  }
end)
