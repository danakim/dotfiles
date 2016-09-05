" General settings
set paste
set nocompatible
set number
set cursorline
" Allow delete/backspace on Apple keyboards to delete over everything
set backspace=indent,eol,start

" Statusline
set laststatus=2
set statusline=%l/%L\ \ --\ \ %f\ \ --\ \ %y

" Syntax highlighting and color scheme
syntax on
set background=dark

" Solarized color scheme options
"let g:solarized_termcolors = 256
"let g:solarized_termtrans = 1
"colorscheme solarized

" Base 16 color scheme and options
let base16colorspace=256
colorscheme base16-tomorrow

" Tabbing and indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set noshiftround
filetype plugin on
filetype indent on
"set smartindent
"set autoindent

" Visualise tabs/spaces/trailing spaces
set list
set listchars=tab:>-,trail:.,extends:>

" Set a colored column at 80 characters
set colorcolumn=80

" Autoclose Vim if Nerdtree is the last window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Set f2 to toggle line numbers
nmap <f2> :set number! number?<cr>
" Set f3 to toggle paste
nmap <f3> :set paste! paste?<cr>
" Map <Ctrl N> and <f4> to Nerdtree
map <C-n> :NERDTreeToggle<cr>
map <f4> :NERDTreeToggle<cr>
