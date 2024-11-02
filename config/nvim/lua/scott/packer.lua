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

  -- linter
  use 'mfussenegger/nvim-lint'

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
  use 'f-person/git-blame.nvim'

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
  use ({
      'leoluz/nvim-dap-go',
      config = function()
          require("dap-go").setup({
              dap_configurations = {
            {
              -- Must be "go" or it will be ignored by the plugin
              type = "go",
              name = "Attach remote",
              mode = "remote",
              request = "attach",
            },
          },
          -- delve configurations
          delve = {
            -- the path to the executable dlv which will be used for debugging.
            -- by default, this is the "dlv" executable on your PATH.
            path = "dlv",
            -- time to wait for delve to initialize the debug session.
            -- default to 20 seconds
            initialize_timeout_sec = 20,
            -- a string that defines the port to start delve debugger.
            -- default to string "${port}" which instructs nvim-dap
            -- to start the process in a random available port
            port = "${port}",
            -- additional args to pass to dlv
            args = {},
            -- the build flags that are passed to delve.
            -- defaults to empty string, but can be used to provide flags
            -- such as "-tags=unit" to make sure the test suite is
            -- compiled during debugging, for example.
            -- passing build flags using args is ineffective, as those are
            -- ignored by delve in dap mode.
            build_flags = "",
            -- whether the dlv process to be created detached or not. there is
            -- an issue on Windows where this needs to be set to false
            -- otherwise the dlv server creation will fail.
            detached = true,
            -- the current working directory to run dlv from, if other than
            -- the current working directory.
            cwd = nil,
          },
      })
      end
    })
    use { "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        config = function()
            require("dapui").setup()
        end
    }

  -- testing
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
      "markemmons/neotest-deno",
      "rouge8/neotest-rust",
      "nvim-neotest/neotest-go"
    },
    config = function ()
        -- get neotest namespace (api call creates or returns namespace)
        local neotest_ns = vim.api.nvim_create_namespace("neotest")
        vim.diagnostic.config({
          virtual_text = {
            format = function(diagnostic)
              local message =
                diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
              return message
            end,
          },
        }, neotest_ns)
        require("neotest").setup({
            adapters = {
              require("neotest-jest"),
              require("neotest-deno"),
              require("neotest-rust"),
              require("neotest-go")({
                  experimental = {
                    test_table = true,
                  },
              }),
            }
        })
    end
  }

  -- monorepo
  -- use {
  --  'Equilibris/nx.nvim',
  --   requires = {
  --      'nvim-telescope/telescope.nvim',
  -- },
  -- config = function()
  --      require("nx").setup {
  --          nx_cmd_root = 'pnpm nx'
  --      }
  --  end
  -- }
end)
