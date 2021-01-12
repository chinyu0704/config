" colors on
syntax on

"expand tabs to white spaces in following inserts
"use :set expandtab & :%retab to convert preceding tabs to white spaces
set noexpandtab

"default to 8, don't ever change this
set tabstop=8

"it is set to other than 8 in some non-programing scenarios, we don't need this
"set softtabstop=8
set softtabstop=0

"similar to softtabstop, we don't need this
"set nosmarttab
"indent size
set shiftwidth=8

" 80 characters line
set colorcolumn=81
"execute "set colorcolumn=" . join(range(81,335), ',')
highlight ColorColumn ctermbg=Black ctermfg=DarkRed
highlight ExtraWhitespace ctermbg=red guibg=red

" Highlight trailing spaces
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set background=dark
colorscheme hybrid

set t_Co=256

"abbreviations
abbreviate qy qinyu
abbreviate #i #include
abbreviate #d #define
abbreviate SOB Signed-off-by:
"[^,], any character but ','; '.', any character
"'*', repeat 0 or more times
""\(...\), \(...\)" refered as \1, \2...
"',' between \1 & \2 manually as a separetor since the old one is removed
" change 'last, first' to 'first, last'
abbreviate switch %s/\([^,]*\),\(.*$\)/\2,\1/

"scroll
"when scrolling, make sure there are at least n lines below or above the
"cursor
set scrolloff=3

"format options
set formatoptions=tcqro


"programming

"when typing any bracket, vim cause the curse to jump to the matching bracket
"briefly
set showmatch

"'set paste' toggle
set pastetoggle=<F12>

"add another status line at bottom
set cmdheight=2

"display partial cmd while typing
set showcmd

"beep when there is an err
set errorbells
