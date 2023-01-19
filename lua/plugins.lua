local fn = vim.fn
local cmd = vim.cmd
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

cmd([[packadd packer.nvim]])
return require('packer').startup(function(use)


  use 'wbthomason/packer.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" },
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
      {'PaterJason/cmp-conjure'},
    },
  })

  use({
    "princejoogie/dir-telescope.nvim",
    -- telescope.nvim is a required dependency
    requires = {"nvim-telescope/telescope.nvim"},
    config = function()
      require("dir-telescope").setup({
        hidden = true,
        respect_gitignore = true,
      })
    end,
  })

  use({
    "scalameta/nvim-metals",
    requires = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
  })

  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"},
      config = function()
        require("dapui").setup({
          layouts = {
              {
                  elements = {
                      { id = "scopes", size = 0.25 },
                      { id = "breakpoints", size = 0.25 },
                      { id = "stacks", size = 0.25 },
                      { id = "watches", size = 0.25 },
                  },
                  size = 40,
                  position = "left",
              },
              {
                  elements = {},
                  size = 10,
                  position = "bottom",
              },
          },
      })
      end
  }

  use 'crispgm/nvim-tabline'
  use "lukas-reineke/indent-blankline.nvim"
  use 'tpope/vim-commentary'
  
  --  use 'mfussenegger/nvim-jdtls'

  use 'mfussenegger/nvim-lint'

  use 'RRethy/vim-illuminate' 
  use {
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function()
        require'alpha'.setup(require'alpha.themes.dashboard'.config) 
      end

  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzy-native.nvim" }, }
  }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "SmiteshP/nvim-navic"
  use ({"simrat39/symbols-outline.nvim",
        config = function() 
          require("symbols-outline").setup()
        end
      })
  -- use "b0o/SchemaStore.nvim"
  -- use "github/copilot.vim"

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- clojure
  use 'Olical/conjure'
  use 'dmac/vim-cljfmt'

  use 'simrat39/rust-tools.nvim'

  use({ "kyazdani42/nvim-web-devicons" })

  use {
  	'kyazdani42/nvim-tree.lua',
  	requires = {
    		'kyazdani42/nvim-web-devicons', -- optional, for file icons
  	}
  }

  use({ "sheerun/vim-polyglot" })

  -- git related
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  -- colorschemes
  use { "rebelot/kanagawa.nvim" }
  use { "ellisonleao/gruvbox.nvim" }
  use { "sainnhe/sonokai" }  
  use { "navarasu/onedark.nvim" }
use({
    'rose-pine/neovim',
    as = 'rose-pine'
  })

  -- use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  --     require("toggleterm").setup {
  --       size = 55,
  --       open_mapping = [[<c-\>]],
  --       shade_filetypes = {},
  --       direction = 'float',
  --     }
  --   end 
  -- }

  use { 'akinsho/bufferline.nvim',
        tag = "v2.*", 
        requires = 'kyazdani42/nvim-web-devicons'
    }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

