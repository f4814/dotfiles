""""""""""""""""""
"" BASIC OPTIONS "
""""""""""""""""""
if &compatible
    set nocompatible                " No vi compatible
endif

set t_Co=256                    " 256-bit color
set background=dark
set ttimeoutlen=0               " No esc delay
set vb                          " Don't beep at me
set cursorline                  " Highlight current line
set cursorcolumn                " Highlight current column
set scrolloff=3                 " Start scrolling when I'm 3 lines from top/bottom
set backupdir=~/.vim/backup/    "
set directory=~/.vim/backup/    " Where to save swap files
set undodir=~/.vim/backup/      " Persistent undo
set hidden                      " Multiple buffer editing

" Tab specific option
set tabstop=8                   "A tab is 4 spaces
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
set wildmode=longest,full       " Appereance of auto-complete window

" Indetiation
set autoindent                  " keep indentiation
set smartindent                 " be smart
filetype plugin indent on

"""""""""""
"" LAYOUT "
"""""""""""
set number                      " Show line numbers
set encoding=utf-8

" Syntax
if !exists('g:syntax_on')
    syntax on
endif

colorscheme jellybeans
let g:hs_highlight_delimiters = 1
let g:hs_highlight_boolean = 1
let g:hs_highlight_types = 1
let g:hs_highlight_debug = 1

" Make airline look nicer
set laststatus=2                " Always display the statusline in all windows
set showtabline=2               " Always display the tabline
set noshowmode                  " Hide the default mode text

"""""""""""""""""""
"" PLUGIN CONFIG "
"""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'xolox/vim-misc'

Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'

Plug 'ryanoasis/vim-devicons' " Not working with URXVT config atm
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'vimwiki/vimwiki'

" Languages
Plug 'sheerun/vim-polyglot' " Language syntax
Plug 'tomtom/tcomment_vim' " commenting

Plug 'tmhedberg/SimpylFold',          {'for': ['python']} " Python Folding

call plug#end()

" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "minimalist"

" Python stuff
let g:SimpylFold_fold_import = 0

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*'] " Just in case I'll ever install fugitive

""""""""""""""""""""
"" SHORTCUT CONFIG "
""""""""""""""""""""
let mapleader = ","

" Split navigation with C-[hjkl]
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" toggle editor settings
nnoremap <leader>eh <Esc>:noh<CR>
nnoremap <leader>ep <Esc>:set paste!<CR>
let g:NumberToggleTrigger = "<leader>en"
