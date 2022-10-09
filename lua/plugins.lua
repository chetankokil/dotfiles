local fn = vim.fn
local cmd = vim.cmd
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

cmd([[packadd packer.nvim]])
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

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
 
  use 'mfussenegger/nvim-lint'

  use 'RRethy/vim-illuminate' 
  use {
      'goolord/alpha-nvim',
      config = function()
        require('chetan.alpha')
      end

  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "ray-x/lsp_signature.nvim"
  use "SmiteshP/nvim-navic"
  use "simrat39/symbols-outline.nvim"
  use "b0o/SchemaStore.nvim"
  -- use "github/copilot.vim"

  use {
    "glepnir/dashboard-nvim",
     config = function()
       require("chetan.dashboard").setup()
     end,
  }

  use 'simrat39/rust-tools.nvim'

  use({ "kyazdani42/nvim-web-devicons" })

  use {
  	'kyazdani42/nvim-tree.lua',
  	requires = {
    		'kyazdani42/nvim-web-devicons', -- optional, for file icons
  	}
  }

  use({ "sheerun/vim-polyglot" })

  use "rebelot/kanagawa.nvim"

  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup {
        size = 55,
        open_mapping = [[<c-\>]],
        shade_filetypes = {},
        direction = 'vertical',
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
