--------------------------------------------------------------------
--     _   __      _                ______            _____       --
--    / | / /   __(_)___ ___       / ____/___  ____  / __(_)___ _ --
--   /  |/ / | / / / __ `__ \     / /   / __ \/ __ \/ /_/ / __ `/ --
--  / /|  /| |/ / / / / / / /    / /___/ /_/ / / / / __/ / /_/ /  --
-- /_/ |_/ |___/_/_/ /_/ /_/     \____/\____/_/ /_/_/ /_/\__, /   --
--                                                      /____/    --
--------------------------------------------------------------------

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent=true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.colorcolumn = '80'
vim.o.signcolumn = 'yes'
vim.o.updatetime = 500
vim.o.lazyredraw = true
vim.o.compatible = false
vim.o.inccommand = "nosplit"
vim.o.breakindent = true
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.undofile = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
vim.o.expandtab = true
vim.o.hidden = true
vim.o.spelllang = 'en,es'
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.o.wrap= false
vim.o.showmode = false
vim.o.autoindent = true

-- proper syntax highlighting for Mardown
vim.cmd('au BufNewFile,BufReadPost *.md set filetype=markdown')
vim.g.markdown_fenced_languages = {'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'bash'}

-- enable comments in json
vim.cmd('au BufNewFile,BufRead *.json set filetype=jsonc')

-- Completion
vim.o.shortmess = vim.o.shortmess..'c'
vim.o.completeopt = 'menuone,noinsert,noselect'

-- avoid :terminal to show line numbers
vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber')

vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' 

require('packerConfig')

-- blankline
vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile'}
vim.g.indent_blankline_char_highlight = 'LineNr'
