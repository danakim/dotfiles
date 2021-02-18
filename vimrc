" General settings
set nocompatible
set number relativenumber
set cursorline
set hlsearch
set incsearch

" Allow delete/backspace on Apple keyboards to delete over everything
"
set backspace=indent,eol,start

" Statusline
set laststatus=2
set statusline=%l/%L\ \ --\ \ %f\ \ --\ \ %y

" Syntax highlighting
syntax on

"" Color schemes
" Solarized
"let g:solarized_termcolors = 256
"let g:solarized_termtrans = 1
"colorscheme solarized
" Base 16
"let base16colorspace=256
"colorscheme base16-tomorrow
" Afterglow
"colorscheme afterglow
" Twilight
colorscheme twilight256
hi CursorLine term=bold cterm=bold guibg=lightgrey

" Tabbing and indentation
filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set noshiftround
set autoindent
set smartindent

" Visualise tabs/spaces/trailing spaces
set list
set listchars=tab:>-,trail:.,extends:>

" Set a colored column at 80 characters
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Toggle the Rainbow parantheses plugin - https://github.com/luochen1990/rainbow
let g:rainbow_active = 1

" Autoclose Vim if Nerdtree is the last window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Set f2 to toggle line numbers
nmap <f2> :set number! number?<cr>
" Set f3 to toggle paste
nmap <f3> :set paste! paste?<cr>
" Map <Ctrl N> and <f4> to Nerdtree
map <C-n> :NERDTreeToggle<cr>
map <f4> :NERDTreeToggle<cr>
" Set f5 to clear highlighted search
nnoremap <f5> :noh<cr>

" Tab shortcut mappings
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
nnoremap <C-t> :tabnew<Space>
inoremap <C-t> <Esc>:tabnew<Space>
nnoremap H gT
nnoremap L gt

" Tell vim to use the system clipboard when yanking lines
set clipboard=unnamed

" Trick to automatically set paste on and off when pasting
" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Tell Vim to remember the last line when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Trigger a highlight using the QuickScope plugin in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"" Options for the Completor plugin
" Use TAB to complete when typing words, else inserts TABs as usual.  Uses
" dictionary, source files, and completor to find matching words to complete.

" Note: usual completion is on <C-n> but more trouble to press all the time.
" Never type the same word twice and maybe learn a new spellings!
" Use the Linux dictionary when spelling is in doubt.
function! Tab_Or_Complete() abort
  " If completor is already open the `tab` cycles through suggested completions.
  if pumvisible()
    return "\<C-N>"
  " If completor is not open and we are in the middle of typing a word then
  " `tab` opens completor menu.
  elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^[[:keyword:][:ident:]]'
    return "\<C-R>=completor#do('complete')\<CR>"
  else
    " If we aren't typing a word and we press `tab` simply do the normal `tab`
    " action.
    return "\<Tab>"
  endif
endfunction

" Use `tab` key to select completions.  Default is arrow keys.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use tab to trigger auto completion.  Default suggests completions as you type.
"let g:completor_auto_trigger = 0
"inoremap <expr> <Tab> Tab_Or_Complete()

" Enable Pathogen
execute pathogen#infect()
