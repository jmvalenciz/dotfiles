-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

require('packer').startup(
    function()
        use 'wbthomason/packer.nvim'
        use 'neovim/nvim-lspconfig'
        use {'nvim-treesitter/nvim-treesitter', run= ':TSUpdate'}
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/nvim-cmp'
        use 'L3MON4D3/LuaSnip'
        use 'windwp/nvim-autopairs'
        --use 'kylechui/nvim-surround'
        use {'lewis6991/gitsigns.nvim',requires = {'nvim-lua/plenary.nvim'}}
        --use {'tpope/vim-fugitive'}
        use {
            'hoob3rt/lualine.nvim',
            requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }
        use 'editorconfig/editorconfig-vim'
        use {
            'nvim-telescope/telescope.nvim',
            requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
        }
        use 'folke/tokyonight.nvim'
        use {
            'kyazdani42/nvim-tree.lua',
            requires = 'kyazdani42/nvim-web-devicons',
        }
        --use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
        use 'folke/which-key.nvim'
        use {
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
        }
        use 'mfussenegger/nvim-dap'
        use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
        use {'luukvbaal/stabilize.nvim',config=function() require("stabilize").setup() end}
        use "lukas-reineke/indent-blankline.nvim"
        use "kyazdani42/nvim-web-devicons"
    end
)

