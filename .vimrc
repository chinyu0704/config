" colors on
syntax on

set noexpandtab
set smarttab
set tabstop=8
set softtabstop=8

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
abbreviate last,first %s/\([^,]*\),\(.*$\)/\2,\1/

