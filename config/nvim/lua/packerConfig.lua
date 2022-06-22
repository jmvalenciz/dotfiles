-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

require('packer').startup(
    function()
        use 'wbthomason/packer.nvim'
        --use 'nathom/filetype.nvim'
        use 'vimwiki/vimwiki'
        use 'tools-life/taskwiki'
        --use 'dhruvasagar/vim-table-mode'
        use 'neovim/nvim-lspconfig'
        use 'windwp/nvim-autopairs'
        use 'nvim-lua/lsp_extensions.nvim'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'
        use 'L3MON4D3/LuaSnip'
        use 'rafamadriz/friendly-snippets'
        use 'saadparwaiz1/cmp_luasnip'
        --use 'ray-x/lsp_signature.nvim'
        use {'nvim-treesitter/nvim-treesitter', run= ':TSUpdate'}
        use 'windwp/nvim-ts-autotag'
        use 'p00f/nvim-ts-rainbow'
        use 'stevearc/dressing.nvim'
        use 'onsails/lspkind-nvim'
        use 'lukas-reineke/indent-blankline.nvim'
        use {'lewis6991/gitsigns.nvim',requires = {'nvim-lua/plenary.nvim'}}
        use {'tpope/vim-fugitive'}
        use {
            'luukvbaal/stabilize.nvim',
            config = function() require("stabilize").setup() end
        }
        --use 'glepnir/dashboard-nvim'
        use {
            'hoob3rt/lualine.nvim',
            requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }
        use 'editorconfig/editorconfig-vim'
        use 'glepnir/lspsaga.nvim'
        use {
            'nvim-telescope/telescope.nvim',
            requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
        }
        use 'wittyjudge/gruvbox-material.nvim'
        use 'folke/tokyonight.nvim'
        use 'mattn/emmet-vim'
        use 'norcalli/nvim-colorizer.lua'
        use {
            'kyazdani42/nvim-tree.lua',
            requires = 'kyazdani42/nvim-web-devicons',
            config = function() require'nvim-tree'.setup {} end
        }
        use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
        use 'folke/which-key.nvim'
        use {
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
        }
    end
)

require('plugins/cmp')
require('plugins/vimwiki')
require('plugins/luasnip')
require('plugins/nvim-tree')
require("plugins/bufferline")
--require('plugins/filetype')
require('plugins/editorconfig')
require('plugins/colorizer')
--require('plugins/lspsaga')
require('plugins/theme')
require('plugins/dashboard')
require('plugins/lsp')
require('plugins/dressing')
require('plugins/autopairs')
require('plugins/treesitter')
require('plugins/telescope')
require('plugins/gitsigns')
require('plugins/line')
require('plugins/which-key')
require('plugins/indent-blankline')
require('plugins/trouble')
