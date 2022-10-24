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

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" },
    },
  })

  use({
    "scalameta/nvim-metals",
    requires = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
  })

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
    requires = { {'nvim-lua/plenary.nvim'} }
  }

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



  use 'simrat39/rust-tools.nvim'

  use({ "kyazdani42/nvim-web-devicons" })

  use {
  	'kyazdani42/nvim-tree.lua',
  	requires = {
    		'kyazdani42/nvim-web-devicons', -- optional, for file icons
  	}
  }

  use({ "sheerun/vim-polyglot" })

  -- colorschemes
  use "rebelot/kanagawa.nvim"
  use { "ellisonleao/gruvbox.nvim" }
  use { "sainnhe/sonokai" } 
  

  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup {
        size = 55,
        open_mapping = [[<c-\>]],
        shade_filetypes = {},
        direction = 'float',
      }
    end 
  }

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

