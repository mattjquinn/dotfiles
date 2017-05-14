" MQUINN 12-20-2014 : Adding for Python development:
set autoindent
set smartindent
set expandtab
autocmd FileType java setlocal shiftwidth=2 tabstop=2
autocmd FileType js setlocal shiftwidth=2 tabstop=2
autocmd FileType py setlocal shiftwidth=4 tabstop=4
autocmd FileType rs setlocal shiftwidth=2 tabstop=2
autocmd FileType c setlocal shiftwidth=2 tabstop=2

" MQUINN 01-10-2015 : Enable syntax highlighting:
filetype plugin indent on
syntax on

" MQUINN 01-22-2015 : Enabling line numbers.
set number

" MQUINN 01-22-2015 : Highlight unnecessary trailing whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" MQUINN 02-24-2015 : Intentionally break the arrow keys
" to get myself in the habit of using the homerow.
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" MQUINN 03-20-2017 : Miscellaneous additions.
set wildmenu " enable visual autocomplete menu
             " for Vim commands
set showmatch " highlight matching [{()}]
