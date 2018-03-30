" set the runtime path to include Vundle and initialize
set rtp+=~/.vim_runtime/plugins/Vundle.vim
call vundle#begin('~/.vim_runtime/plugins/')
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/indentpython.vim'
"Bundle 'Valloric/YouCompleteMe
"Plugin 'https://github.com/vim-syntastic/syntastic' "syntax and style checker
Plugin 'jnurmine/Zenburn'
Plugin 'vim-scripts/peaksea'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'https://github.com/joshdick/onedark.vim'
"Plugin 'https://github.com/Blevs/vim-dzo'
"Plugin 'https://github.com/wincent/command-t'
"Plugin 'klen/python-mode'


" All of your Plugins must be added before the following line
call vundle#end()            " required
" Enable filetype plugins
filetype plugin on
filetype plugin indent on    " required


"NERD Tree settings
autocmd StdinReadPre * let s:std_in=1
"autostart NerdTree
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


"Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=1
let g:syntastic_python_checkers = ['flake8'] "don't use heavy checks
let g:syntastic_python_flake8_args='--ignore=E501,E225'
"supress some messages
let g:syntastic_quiet_messages = {
    \ "!level":  "errors",
    \ "type":    "style"}
noremap ]l :lnext<CR> 
noremap [l :lp<CR> 

"pymode settings
let g:pymode_lint_ignore = "F401, E501"


let g:ycm_autoclose_preview_window_after_completion=1
"map <C-g>  :YcmCompleter GoToDefinitionElseDeclaration<CR>


