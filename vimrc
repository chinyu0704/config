"vundle settings starts here
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdtree'
"Plugin 'zxqfl/tabnine-vim'
"Plugin 'vim-syntastic/syntastic'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
"either lightline or vim-airline
"Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'chinyu0704/vim-cscope'
Plugin 'chinyu0704/vim-hybrid'
Plugin 'yegappan/taglist'
Plugin 'tpope/vim-capslock'
Plugin 'romainl/vim-cool'
"Plugin 'Yilin-Yang/vim-markbar'
Plugin 'hari-rangarajan/CCTree'
Plugin 'skywind3000/vim-preview'
"Plugin 'ianva/vim-youdao-translater'
"Plugin 'ludovicchabant/vim-gutentags'
Plugin 'inkarkat/vim-EnhancedJumps'
Plugin 'inkarkat/vim-ingo-library'
"Plugin 'brookhong/cscope.vim'
Plugin 'erig0/cscope_dynamic'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'sonph/onehalf'
Plugin 'tpope/vim-surround'

"navigation
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/vim-easyoperator-line'
Plugin 'haya14busa/vim-easyoperator-phrase'

"make the search blink
Plugin 'ivyl/vim-bling'

"for python
Plugin 'ycm-core/YouCompleteMe'
Plugin 'nvie/vim-flake8'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'vim-test/vim-test'
Plugin 'tell-k/vim-autopep8'
"Plugin 'davidhalter/jedi-vim'

Plugin 'preservim/tagbar'
Plugin 'davidhalter/jedi-vim'

" colors
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'ericbn/vim-solarized'
Plugin 'kaicataldo/material.vim', { 'branch': 'main' }

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
"colorscheme onehalfdark
let g:solarized_termcolors=256
let g:material_theme_style='ocean'
colorscheme material
"let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'

if (has('termguicolors'))
  set termguicolors
endif

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
set wildmode=longest:full,full

"incremetal search & highlight search
set hls
set incsearch

"display line nr as default
set number

"maps
"ctags list toggle
noremap <silent> <F7> :TlistToggle<cr>
"nerdtree toggle
noremap <silent> <F8> :NERDTreeToggle<cr>

"source config files
"source ~/.vim/plugin/cscope_config.vim


"ligitline color scheme config
"let g:lightline = {'colorscheme': 'wombat',}
"set laststatus=2

"vim airline theme
let g:airline_theme='onehalfdark'
"let g:airline_solarized_bg='dark'

"autocmd add here:
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"gitgutter settings
set updatetime=100

"syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

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

set encoding=utf-8

"enable airline tab line
let g:airline#extensions#tabline#enabled = 1
" airline buffer list top format
let g:airline#extensions#tabline#formatter = 'unique_tail'

"ariline tab list switch
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab

"markbar config
nmap <Leader>m <Plug>ToggleMarkbar

" the following are unneeded if ToggleMarkbar is mapped
nmap <Leader>mo <Plug>OpenMarkbar
nmap <Leader>mc <Plug>CloseMarkbar

" this is required for mark names to persist between editor sessions
if has('nvim')
    set shada+=!
else
"<'> this save jumplist to viminfo and jumplist can be reused when vim restart
    set viminfo+=!
endif

let g:markbar_width = 70


"airline bottom bar customization
let g:airline_section_b = ''
let g:airline_section_error = ''
let g:airline_section_warning = ''

"youdao translation key map
"vnoremap <silent> <C-T> :<C-u>Ydv<CR>
"nnoremap <silent> <C-T> :<C-u>Ydc<CR>
"noremap <leader>yd :<C-u>Yde<CR>

"vim-preview key binding
noremap <c-\>p :PreviewTag<cr>
noremap <c-\><c-\>p :PreviewGoto<cr>

noremap <s-u> :PreviewScroll -1<cr>
noremap <s-d> :PreviewScroll +1<cr>
inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>


"guentags config
" recursive search upwards until encounter one of following dirs
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" cached ctags file suffix
let g:gutentags_ctags_tagfile = '.tags'
"
" dir to store .ctags
let s:vim_tags = expand('~/.ctags')
let g:gutentags_cache_dir = s:vim_tags
" auto
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif

" ctags parameters
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"-------------------

"config for brookhong/cscope.vim
let g:cscope_interested_files = '\.c$\|\.cpp$\|\.h$\|\.x$\|\.s$\|\.S$'
let g:cscope_split_threshold = 9999

" config for cscope dynamic
nmap <C-\><C-\>i <Plug>CscopeDBInit

nmap <F8> :TagbarToggle<CR>


"function! HighlightEnabledConfigs()
"    let config_path = '.config'
"    let configs = []
"    if filereadable(config_path)
"        for line in readfile(config_path)
"            if line =~ '^CONFIG_.*=y'
"                let config = matchstr(line, '^CONFIG_\w*')
"                call add(configs, config)
"            endif
"        endfor
"    endif
"
"    for config in configs
"        try
"            silent! execute 'syntax match ConfigEnabled /\<' . config . '\>/' 'containedin=ALLBUT,contains=TOP'
"            execute 'highlight ConfigEnabled ctermfg=Green guifg=Green'
"        catch
"            echom 'Failed to create syntax match for: ' . config
"        endtry
"    endfor
"endfunction
"
"autocmd BufReadPost *.c,*.h call HighlightEnabledConfigs()
"
function! HighlightEnabledConfigs()
    let config_path = '.config'
    let configs_y = []
    let configs_m = []
    if filereadable(config_path)
        for line in readfile(config_path)
            if line =~ '^CONFIG_.*=y'
                let config = matchstr(line, '^CONFIG_\w*')
                call add(configs_y, config)
            elseif line =~ '^CONFIG_.*=m'
                let config = matchstr(line, '^CONFIG_\w*')
                call add(configs_m, config)
            endif
        endfor
    endif

    " Apply different syntax highlighting for configs set to 'y'
    for config in configs_y
        silent! execute 'syntax match ConfigEnabledY /\<' . config . '\>/' 'containedin=ALLBUT,contains=TOP'
        execute 'highlight ConfigEnabledY ctermfg=Green guifg=Green'
    endfor

    " Apply different syntax highlighting for configs set to 'm'
    for config in configs_m
        silent! execute 'syntax match ConfigEnabledM /\<' . config . '\>/' 'containedin=ALLBUT,contains=TOP'
        execute 'highlight ConfigEnabledM ctermfg=Yellow guifg=Yellow'
    endfor
endfunction

autocmd BufReadPost *.c,*.h call HighlightEnabledConfigs()

