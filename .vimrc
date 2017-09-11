""""""""""""""""""
"" BASIC OPTIONS "
""""""""""""""""""
set nocompatible                " No vi compatible
filetype on
set t_Co=256                    " 256-bit color
set background=dark
set ttimeoutlen=0               " No esc delay
set ic
set vb                          " Don't beep at me
set cursorline                  " Highlight current line
set cursorcolumn                " Highlight current column
set scrolloff=3                 " Start scrolling when I'm 3 lines from top/bottom
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/
set hidden                      " Multiple buffer editing

" Tab specific option
set tabstop=4                   "A tab is 4 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=4               "Insert 4 spaces when tab is pressed
set smarttab
set shiftwidth=4                "An indent is 4 spaces
set shiftround                  "Round indent to nearest shiftwidth multiple

" Search
set hlsearch                    " Highlight my search
set incsearch                   " Incremental
set ignorecase
set smartcase                   " Don't ignore uppercase

" Allow saving files as sudo
cmap w!! w !sudo tee > /dev/null %<CR>

" Natural splits
set splitbelow
set splitright

" Autocomplete
set wildmenu                    " Autocomplete paths
set path+=**                    " Recursive path; Allows recursive :find
set wildignore+=*/tmp/*,*.swp   " Ignore tmp and swp
set wildmode=list,full          " Appereance of auto-complete window

" Indetiation
set autoindent                  " keep indentiation
set smartindent                 " be smart
filetype plugin indent on

"""""""""""
"" LAYOUT "
"""""""""""
set number                      " Show line numbers
set encoding=utf8

" Syntax
syntax on
colorscheme jellybeans
let g:hs_highlight_delimiters = 1
let g:hs_highlight_boolean = 1
let g:hs_highlight_types = 1
let g:hs_highlight_debug = 1
let g:python_highlight_all = 1 " All python options

" Make airline look nicer
set laststatus=2                " Always display the statusline in all windows
set showtabline=2               " Always display the tabline
set noshowmode                  " Hide the default mode text

"""""""""""""""""""
"" PLUGIN CONFIG "
"""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'xolox/vim-misc'

Plug 'wikitopian/hardmode'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-surround'

Plug 'ryanoasis/vim-devicons' " Not working with URXVT config atm
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Language support
Plug 'autozimu/LanguageClient-neovim',{ 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'

Plug 'vim-python/python-syntax',      {'for': ['python']} " Python Syntax
Plug 'tmhedberg/SimpylFold',          {'for': ['python']} " Python Folding

Plug 'urso/haskell_syntax.vim'

call plug#end()

" LSP
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie', '--lsp'],
    \ 'python': ['pyls']
    \ }

let g:LanguageClient_changeThrottle = 0.5 " 0.5 Delay

augroup LanguageClient_config
    au!
    " Kepp signcolumn open if LC is started
    au User LanguageClientStarted setlocal signcolumn=yes
    au User LanguageClientStopped setlocal signcolumn=auto
augroup END

" auto hardmode
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()n

" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "minimalist"

" CtrlP
let g:ctrlp_extensions = ['tag']

" Python stuff
let g:python_highlight_all = 1
let g:SimpylFold_fold_import = 0

""""""""""""""""""""
"" SHORTCUT CONFIG "
""""""""""""""""""""
let mapleader = ","

" Split navigation with C-[hjkl]
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" hardmode
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" numbertoggle
let g:NumberToggleTrigger = "<leader>r"

" :noh
nnoremap <leader>u <Esc>:noh<CR>

" toggle paste mode
nnoremap <leader>p <Esc>:set paste!<CR>
