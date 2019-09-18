set expandtab ts=4 sw=4 ai
set termguicolors
set number
set showmatch
set ignorecase
set mouse=a
set encoding=UTF-8

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>


let ayucolor="mirage"


""""""""""""""""""
"""" VIM-PLUG """"
""""""""""""""""""
call plug#begin()
"Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'w0rp/ale'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'ervandew/supertab'
Plug 'Shougo/echodoc.vim'
Plug 'scrooloose/nerdtree'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'oblitum/rainbow'

"HIGHLIGHTING
Plug 'sheerun/vim-polyglot'
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

call plug#end()

colorscheme onedark

""""""""""""""
"" Deoplete ""
""""""""""""""
let g:deoplete#enable_at_startup = 1
augroup deopleteCompleteDoneAu
  autocmd!
  autocmd CompleteDone * silent! pclose!
augroup END
let g:SuperTabDefaultCompletionType = '<c-n>'

set noshowmode
let g:echodoc_enable_at_startup = 1

""""""""""""""
"" NerdTree ""
""""""""""""""
let g:NERDTreeChDirMode = 2
map <F2> :NERDTreeToggle<CR>

""""""""""""""""""
"" Ultisnippets ""
""""""""""""""""""
let g:UltiSnipsExpandTrigger = '<Space-j>'
let g:UltiSnipsJumpForwardTrigger = '<Space-j>'

"""""""""
"" ALE ""
"""""""""
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

""""""""""""""
"" Insearch ""
""""""""""""""
" Maps requeridos
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

" Quitar resaltado luego de buscar
let g:incsearch#auto_nohlsearch = 1

"""""""""""""""
"" GITGUTTER ""
"""""""""""""""
set updatetime=250

"""""""""""""
"" airline ""
"""""""""""""
let g:airline_powerline_fonts = 1

"""""""""""""
"" rainbow ""
"""""""""""""
let g:rainbow_active = 1
