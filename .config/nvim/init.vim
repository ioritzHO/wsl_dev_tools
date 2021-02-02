set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set background=dark
set number
set relativenumber
set cursorline

set termguicolors " if you want to run vim in a terminal
colorscheme lucius
LuciusDarkLowContrast

"" Clipboard
set clipboard=unnamed			" use system clipboard as default clipboard
let g:clipboard = {
      \   'name': 'wslclipboard',
      \   'copy': {
      \      '+': '/usr/local/bin/win32yank.exe -i --crlf',
      \      '*': '/usr/local/bin/win32yank.exe -i --crlf',
      \    },
      \   'paste': {
      \      '+': '/usr/local/bin/win32yank.exe -o --lf',
      \      '*': '/usr/local/bin/win32yank.exe -o --lf',
      \   },
      \   'cache_enabled': 1,
      \ }

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set wildmenu
set wildmode=longest:full,full
set wildignorecase              " ignore case for dir and files

" coc
source $HOME/.config/nvim/plug-config/coc.vim

" air-line
let g:airline_theme             = 'lucius'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" User remaps
let mapleader = ","
nmap <Leader>r :registers<CR>
nmap <Leader>b :ls<CR>
nmap <Leader>m :marks<CR>
nmap <Leader>C I//<ESC>|				" comment line
nmap <Leader>c bi//<ESC>|				" comment from word
nmap <Leader><Space> :/\s\+$<CR>|		" look for trailing spaces
nmap <Leader>+ <C-w>>
nmap <Leader>- <C-w><
nmap <Leader>= <C-w>=
nmap <Leader>w <C-W><C-W>
nmap <Leader>l <C-W><C-W>|               " ,w is not working on terminal vim. Let's try ,l
nmap <Leader>s :set scb!<CR>|			" toggle scrollbind
nmap <Leader>d :call DiffToggle()<CR>
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>g <Leader>vv|              " EasyGrep current word remap
nmap <Leader>f :Files<CR>|               " launch fzf file search

" Define a function called DiffToggle.
" The ! overwrites any existing definition by this name.
function! DiffToggle()
    " Test the setting 'diff', to see if it's on or off.
    " (Any :set option can be tested with &name.
    " See :help expr-option.)
    if &diff
        diffoff
    else
        diffthis
    endif
:endfunction

call plug#begin(stdpath('data') . '/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
"Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'dkprice/vim-easygrep'
Plug 'aserebryakov/vim-todo-lists'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'gosukiwi/vim-atom-dark'
Plug 'fneu/breezy'
call plug#end()

