
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- theme packs 
  -- use ({ "ellisonleao/gruvbox.nvim", as = 'gruvbox', config = function() vim.cmd('colorscheme gruvbox') end})
  use ({ "folke/tokyonight.nvim", as = 'tokyonight' })

  -- telescope (fuzzy search) 
  use { "nvim-lua/plenary.nvim" }
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { {'nvim-lua/plenary.nvim'} } }

  -- treesitter
  use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} )
  use ( 'nvim-treesitter/playground')
  -- undotree 
  use { 'mbbill/undotree' }

  -- comments
  use { "terrortylor/nvim-comment" }

  -- custom status line 
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

  -- diagrams 
  use { 'jbyuki/venn.nvim' }

  -- homepage
  use{
	"goolord/alpha-nvim",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = "require('arjun.alpha')",
    cmd = {
      "Alpha",
      "AlphaRedraw"
    },
    event="BufWinEnter"
  }

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
end)
