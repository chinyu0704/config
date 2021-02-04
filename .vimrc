"vundle settings starts here
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdtree'
Plugin 'zxqfl/tabnine-vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'junegunn/fzf.vim'
"Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'chinyu0704/vim-cscope'
Plugin 'chinyu0704/vim-hybrid'
Plugin 'yegappan/taglist'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"vundle settings end

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

"wildcard ignore
set wildignore=*.o

"display menu when press <tab>
set wildmenu

"incremetal search & highlight search
set hls
set incsearch

"display line nr as default
set number

"maps
"ctags list toggle
noremap <silent> <F10> :TlistToggle<cr>
"nerdtree toggle
noremap <silent> <F9> :NERDTreeToggle<cr>

"source config files
"source ~/.vim/plugin/cscope_config.vim


"ligitline color scheme config
"let g:lightline = {'colorscheme': 'jellybeans',}
"set laststatus=2

"vim airline theme
let g:airline_theme='angr'

"autocmd add here:
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"gitgutter settings
set updatetime=100

"syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_c_checkers = ['checkpatch', 'gcc']
"If you're using YCM's identifier completer in C-family languages but cannot use the clang-based semantic completer for those languages and want to use the GCC Syntastic checkers, unset this option.
let g:ycm_show_diagnostics_ui = 0
"when multiple checkers find error, display all of them together
let g:syntastic_aggregate_errors = 1
"don't display error in included files
let g:syntastic_c_remove_include_errors = 1
"You can configure whether GitGutter preserves or clobbers other signs using
"g:gitgutter_sign_allow_clobber. Set to 1 to clobber other signs (default on
"Vim >= 8.1.0614 and NeoVim >= 0.4.0) or 0 to preserve them.
let g:gitgutter_sign_allow_clobber = 0
