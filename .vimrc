""""""""""""""""""
"" BASIC OPTIONS "
""""""""""""""""""
set nocompatible                " No vi compatible
filetype off
set t_Co=256                    " 256-bit color
set background=dark
set ttimeoutlen=0               " No esc delay
set ic
set vb                          " Don't beep at me
set cursorline                  " Highlight current line
set cursorcolumn                " Highlight current column
set scrolloff=3                 " Start scrolling when I'm 3 lines from top/bottom
set noswapfile

" Tab specific option
set tabstop=4                   "A tab is 8 spaces
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

" Make powerline look nicer
set laststatus=2                " Always display the statusline in all windows
set showtabline=2               " Always display the tabline
set noshowmode                  " Hide the default mode text

"""""""""""""""""""
"" PLUGIN CONFIG "
"""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim "set the runtime path to include & initialize
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'xolox/vim-misc'
Plugin 'wikitopian/hardmode'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'xolox/vim-easytags'

" Language support
Plugin 'vim-python/python-syntax',      {'for': ['python']} " Syntax
Plugin 'tmhedberg/SimpylFold',          {'for': ['python']} " Folding

call vundle#end()

" Powerline setup
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" auto hardmode
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" ALE
let g:ale_lint_delay = 1000
let g:ale_sign_column_always = 1 " b/c jumping text
let g:ale_linters = { 'haskell' : ['hdevtools']}
let g:ale_sign_error = "✗"
let g:ale_sign_warning = "⚠"

" easytags
let g:easytags_async = 1

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

" Open NERDTree
:nnoremap <leader>n :NERDTreeToggle<CR> 

" hardmode
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" tagbar
nnoremap <leader>t :TagbarToggle<CR>

" numbertoggle
let g:NumberToggleTrigger = "<leader>r"

" ALE
nnoremap <leader>s <Esc>:ALEToggle<CR>

" :noh
nnoremap <leader>u <Esc>:noh<CR>

" make program
nnoremap <leader>m <Esc>:wa<CR>:!make 
