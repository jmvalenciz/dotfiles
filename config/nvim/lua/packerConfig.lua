-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

require('packer').startup(
    function()
        use 'neovim/nvim-lspconfig'
        use 'glepnir/lspsaga.nvim'
        use 'jiangmiao/auto-pairs'
        use 'nvim-lua/lsp_extensions.nvim'
        use 'hrsh7th/nvim-compe'
        use 'hrsh7th/vim-vsnip'
        use 'hrsh7th/vim-vsnip-integ'
        use 'ray-x/lsp_signature.nvim'
        use 'wbthomason/packer.nvim'
        use 'navarasu/onedark.nvim'
        use 'sainnhe/gruvbox-material'
        use {'nvim-treesitter/nvim-treesitter', run= ':TSUpdate'}
        use 'p00f/nvim-ts-rainbow'
        use {"lukas-reineke/indent-blankline.nvim"}
        use {'lewis6991/gitsigns.nvim',requires = {'nvim-lua/plenary.nvim'}} 
        use {
            'hoob3rt/lualine.nvim',
            requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }
        use 'editorconfig/editorconfig-vim'
        use {
            'nvim-telescope/telescope.nvim',
            requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
        }
        use 'mattn/emmet-vim'
        use 'norcalli/nvim-colorizer.lua'
    end
)

require('plugins/compe')
require('plugins/editorconfig')
require('plugins/colorizer')
require('plugins/lspsaga')
require('plugins/theme')
require('plugins/lsp')
require('plugins/autopairs')
require('plugins/treesitter')
require('plugins/telescope')
require('plugins/gitsigns')
require('plugins/line')
