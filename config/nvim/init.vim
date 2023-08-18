"--------------------------------------------------------------------
"--     _   __      _                ______            _____       --
"--    / | / /   __(_)___ ___       / ____/___  ____  / __(_)___ _ --
"--   /  |/ / | / / / __ `__ \     / /   / __ \/ __ \/ /_/ / __ `/ --
"--  / /|  /| |/ / / / / / / /    / /___/ /_/ / / / / __/ / /_/ /  --
"-- /_/ |_/ |___/_/_/ /_/ /_/     \____/\____/_/ /_/_/ /_/\__, /   --
"--                                                      /____/    --
"--------------------------------------------------------------------

set foldmethod=expr
set foldlevel=99
set foldexpr=nvim_treesitter#foldexpr()

autocmd BufNewFile,BufRead *.md :set filetype=markdown
autocmd BufNewFile,BufRead *.rasi :set filetype=css
autocmd BufNewFile,BufRead *.tf :set filetype=terraform
autocmd BufNewFile,BufRead *_Dockerfile :set filetype=dockerfile
autocmd ColorScheme *
      \ hi UnusedHighlight ctermbg=NONE guibg=NONE guifg=#808080
"let &t_Cs = "\e[4:3m"
"let &t_Ce = "\e[4:0m"
highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold
hi Error gui=undercurl
hi Warning gui=underline
lua << EOF

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

----Remap space as leader key
--vim.cmd[[nnoremap <SPACE> <Nop>]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.title=true
vim.o.titlestring="NVIM - %{fnamemodify(getcwd(),':t')}"
--vim.o.backup=true
--vim.backupdir = "~/.local/share/nvim/backup//"
vim.cmd('set mouse=a')
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.colorcolumn = '95'
vim.o.signcolumn = 'yes'
vim.o.updatetime = 500
vim.o.lazyredraw = true
vim.o.compatible = false
vim.o.inccommand = "nosplit"
vim.o.breakindent = true
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.undofile = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
vim.o.expandtab = true
vim.o.hidden = true
vim.o.spelllang = 'en,es,cjk'
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.o.wrap= true
vim.o.showmode = false
vim.o.autoindent = true
vim.g.editorconfig = true
--vim.cmd("let vimwiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}")

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

--vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

require('lazymanager')

EOF

" source vimwiki.vim

