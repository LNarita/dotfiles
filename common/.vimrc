set expandtab         " Convert tabs to spaces
set tabstop=4         " <TAB> four spaces
set shiftwidth=4      " Shift width four spaces (for auto indent)
set noautoindent      " Turn off autoindent by default
set smartindent       " Use smart indent instead
set incsearch         " Use incremental searches (cool)
set backspace=2       " Set backspace mode to allow backspacing in insert mode
set ruler             " Show position of cursor in status line
set showmatch         " Show matching parens/braces when writing code

set t_Co=256

filetype on " file type detection
filetype indent on " special indentation rules for file type
filetype plugin on " auto-completion rules for file type

set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

imap jk <Esc>
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>
let mapleader=','
let g:mapleader=','
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
set pastetoggle=<leader>p
