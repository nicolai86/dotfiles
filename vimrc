set nocompatible        " use vim defaults
set scrolloff=3         " keep 3 lines when scrolling
set noai                " set auto-indenting on for programming

set expandtab
set shiftwidth=2
set softtabstop=2

set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
set mouse=a
set clipboard=unnamedplus

set showcmd             " display incomplete commands
set nobackup            " do not keep a backup file
set number              " show line numbers
set ruler               " show the current row and column

set hlsearch            " highlight searches
set incsearch           " do incremental searching
set showmatch           " jump to matches when entering regexp
set ignorecase          " ignore case when searching
set smartcase           " no ignorecase if Uppercase char present

set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

set backspace=indent,eol,start  " make that backspace key work the way it should

syntax on               " turn syntax highlighting on by default
filetype off  " detect type of file
" filetype indent off

filetype plugin indent on

" make < > shift keep selection
vnoremap < <gv
vnoremap > >gv

:highlight Pmenu guifg=#000000 guibg=#020202 gui=bold ctermfg=DarkRed ctermbg=DarkBlue cterm=bold

let mapleader = ","

map <leader>t :CommandT<CR>
