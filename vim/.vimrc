""""""""""""""""""
"" BASIC OPTIONS "
""""""""""""""""""
if &compatible
    set nocompatible                " No vi compatible
endif

set background=dark
set ttimeoutlen=0               " No esc delay
set novisualbell                " Don't do visual bells
set cursorline                  " Highlight current line
set cursorcolumn                " Highlight current column
set colorcolumn=80
set scrolloff=3                 " Start scrolling when I'm 3 lines from top/bottom
set backupdir=~/.vim/backup/    "
set directory=~/.vim/backup/    " Where to save swap files
set undofile                    " Persistent undo
set undodir=~/.vim/backup/
set hidden                      " Multiple buffer editing
set magic                       " Vim magic Regex mode
set listchars=trail:·,tab:\ \    " Show trailing whitespace
set list                        "Required by listchar
set sessionoptions=blank,
    \buffers,curdir,help,
    \tabpages,winsize,terminal
set viewoptions=cursor,folds,slash,unix

" Tab specific option
set tabstop=8                   "A tab is 8 spaces
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

" Ag
if executable('ag')
    set grepprg=ag\ --vimgrep\ --nocolor
endif

" Netrw
let g:netrw_liststyle=3

"""""""""""
"" LAYOUT "
"""""""""""
set number                      " Show line numbers
set encoding=utf-8
set fillchars="vert:|"            " Use pipes in vertical borders

" Syntax
if !exists('g:syntax_on')
    syntax on
endif

" Make lightline look nicer
set laststatus=2                " Always display the statusline in all windows
set showtabline=2               " Always display the tabline
set noshowmode                  " Hide the default mode text

set signcolumn=yes            " Always show signcolumn

" Statusline
set statusline=
set statusline=%q                                       " Quickfix or Loclist
set statusline=%t                                       " tail of the filename
set statusline+=%m                                      " modified flag
set statusline+=%r                                      " read only flag
set statusline+=%=                                      " left/right separator
set statusline+=%y                                      " filetype
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},       " file encoding
set statusline+=%{&ff}]\                                " file format
set statusline+=[%c\:                                    " cursor column
set statusline+=%l/%L]                                  " cursor line/total lines

""""""""""""
"" SCRIPTS "
""""""""""""
augroup Numbers " Toggle relative numbers
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif
augroup END

augroup Session " Manage sessions and views
    autocmd!
    autocmd VimLeave * call <SID>saveSession()
augroup END

augroup StatusLine
    autocmd!
    autocmd InsertEnter,InsertChange * call <SID>statuslineMode('')
    autocmd VimEnter,BufNew,InsertLeave * call <SID>statuslineMode('n')
augroup END

function! s:openSession()
    if filereadable("vimsession")
        source vimsession
    endif
endfunction

function! s:saveSession()
    if filereadable("vimsession")
        mksession! vimsession
    endif
endfunction

" Change highlighting of the status line
function! s:statuslineMode(m)
    setlocal statusline<
    if a:m == 'n'
        let &l:statusline='[N] '.&l:statusline
    elseif v:insertmode == 'i'
        let &l:statusline='[I] '.&l:statusline
    elseif v:insertmode == 'r' || v:insertmode == 'v'
        let &l:statusline='[R] '.&l:statusline
    endif
endfunction

" Modify errorformat to ignore all unmatched lines
function! IgnoreEmptyQuickfix()
    set errorformat+=%-G%.%#
endfunction

" Modify current compiler to be compatible with ninja
function! NinjaInit()
    set makeprg=ninja\ -C\ build
    set errorformat+=%Dninja:\ Entering\ directory\ `%f'
endfunction

"""""""""""""""""""
"" PLUGIN CONFIG "
"""""""""""""""""""
function! PackInit() abort
    packadd minpac
    call minpac#init()

    " Core
    call minpac#add('k-takata/minpac', {'type': 'opt'})
    call minpac#add('sheerun/vim-polyglot') " Language syntax
    call minpac#add('tomtom/tcomment_vim') " commenting
    call minpac#add('tpope/vim-vinegar') " File explorer
    call minpac#add('prabirshrestha/async.vim') " For LSP
    call minpac#add('prabirshrestha/vim-lsp')

    " Misc
    call minpac#add('xolox/vim-misc')

    " UI
    call minpac#add('f4814/vim-termscheme')

    " Edit
    call minpac#add('tpope/vim-surround')
    call minpac#add('editorconfig/editorconfig-vim')
    call minpac#add('godlygeek/tabular', {'type': 'opt'})
    call minpac#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' })
    call minpac#add('junegunn/fzf.vim')

    " Language specific
    call minpac#add('pbrisbin/vim-syntax-shakespeare', {'type': 'opt'})
    call minpac#add('tmhedberg/SimpylFold')
    call minpac#add('Twinside/vim-haskellFold', {'type': 'opt'})
endfunction

command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()

" Color
colorscheme termscheme

" FZF
let g:fzf_buffers_jump = 0 " Always open new window
let g:fzf_command_prefix = 'FZF' " Enable all FZF commands
let g:fzf_colors =
  \ { 'fg':    ['fg', 'Normal'],
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

" LSP
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
    autocmd BufWritePre *.go silent LspDocumentFormatSync
endif


let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_highlights_enabled = 1

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*'] " Just in case I'll ever install fugitive

""""""""""""""""""""
"" SHORTCUT CONFIG "
""""""""""""""""""""
let mapleader = ","
let maplocalleader = " "

" Allow saving files as sudo
command! SudoWrite w !sudo tee > /dev/null %
command! OpenSession call <SID>openSession()

" Split navigation with C-[hjkl]
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

if has('terminal')
    tnoremap <Esc><Esc> <C-\><C-n> " Normal mode in terminal
    tnoremap <C-J> <C-W><C-J>
    tnoremap <C-K> <C-W><C-K>
    tnoremap <C-L> <C-W><C-L>
    tnoremap <C-H> <C-W><C-H>
endif

" Change to alternate buffer
nnoremap <BS> <C-^>

" toggle editor settings
nnoremap <leader>h <Esc>:noh<CR>

nnoremap <LocalLeader>p <Esc>:setlocal paste!<CR>:setlocal paste?<CR>
nnoremap <LocalLeader>l <Esc>:setlocal relativenumber!<CR>:setlocal rnu?<CR>
nnoremap <LocalLeader>n <Esc>:setlocal number!<CR>:setlocal nu?<CR>
nnoremap <LocalLeader>w <Esc>:%s/\s\+$//e<CR>:noh<CR>

" LSP
nnoremap <silent> K <Esc>:LspHover<CR>
nnoremap <silent> gd <Esc>:LspDefinition<CR>
nnoremap <silent> <leader>ls <Esc>:LspWorkspaceSymbol<CR>
nnoremap <silent> <leader>lS <Esc>:LspDocumentSymbol<CR>
nnoremap <silent> <leader>lr <Esc>:LspRename<CR>
nnoremap <silent> <leader>lf <Esc>:LspDocumentFormat<CR>

" FZF
nnoremap <C-t> :FZF<CR>


" Localdots
source ~/.config/localdots/vimrc
