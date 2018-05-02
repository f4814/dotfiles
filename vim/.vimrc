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
set magic                       " Vim magic Regex mode

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

" Make airline look nicer
set laststatus=2                " Always display the statusline in all windows
set showtabline=2               " Always display the tabline
set noshowmode                  " Hide the default mode text

set signcolumn="yes"            " Always show signcolumn

""""""""""""
"" SCRIPTS "
""""""""""""
augroup Numbers " Toggle relative numbers
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif
augroup END

"""""""""""""""""""
"" PLUGIN CONFIG "
"""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Misc
Plug 'xolox/vim-misc'
Plug 'vimwiki/vimwiki'

" UI
Plug 'FabianGeiselhart/vim-monokai-phoenix'
Plug 'kshenoy/vim-signature'
Plug 'itchyny/lightline.vim'

" Edit
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular', {'on': ['Tab', 'Tabularize'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Languages
Plug 'w0rp/ale' " Linting
Plug 'sheerun/vim-polyglot' " Language syntax
Plug 'tomtom/tcomment_vim' " commenting
Plug 'tmhedberg/SimpylFold', {'for': ['python']} " Python Folding

call plug#end()

" Color
colorscheme monokai-phoenix

" FZF
let g:fzf_buffers_jump = 0 " Always open new window
let g:fzf_command_prefix = 'FZF' " Enable all FZF commands
let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" lightline config
let g:lightline = { 'colorscheme': 'molokai' }

" ALE Config
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_loclist = 1
let g:ale_sign_column_always = 1
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_linters = {
    \   'haskell': ['stack-build'],
    \   'python': ['flake8']
    \}

" Python stuff
let g:SimpylFold_fold_import = 0

" Haskell stuff
let haskell_indent_case = 4
let hasekll_indent_guard = 4
let haskell_indent_if = 4

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*'] " Just in case I'll ever install fugitive

""""""""""""""""""""
"" SHORTCUT CONFIG "
""""""""""""""""""""
let mapleader = ","
let maplocalleader = " "

" Split navigation with C-[hjkl]
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

tnoremap <Esc><Esc> <C-\><C-n> " Normal mode in terminal
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>

" toggle editor settings
nnoremap <leader>eh <Esc>:noh<CR>
nnoremap <leader>ep <Esc>:setlocal paste!<CR>
nnoremap <leader>es <Esc>:setlocal spelllang=
nnoremap <leader>en <Esc>:setlocal relativenumber!<CR>
nnoremap <leader>ew <Esc>:%s/\s\+$//e<CR>:noh<CR>
nnoremap <leader>el <Esc>:lopen<CR>
nnoremap <leader>elc <Esc>:lclose<CR>

" Plugins
nnoremap <leader>pc <Esc>:ALELint<CR>

" FZF
nnoremap <C-t> :FZF<CR>
