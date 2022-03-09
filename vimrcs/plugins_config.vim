" set the runtime path to include Vundle and initialize
set rtp+=~/.vim_runtime/plugins/Vundle.vim
call vundle#begin('~/.vim_runtime/plugins/')
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags' "Requires exuberant-ctags package
Plugin 'vim-scripts/taglist.vim' "Requires exuberant-ctags package
"Bundle 'Valloric/YouCompleteMe
"Plugin 'https://github.com/vim-syntastic/syntastic' "syntax and style checker
Plugin 'w0rp/ale' " Check syntax (linting) and fix files asynchronously, with Language Server Protocol (LSP) integration in Vim . Requires NeoVim 0.2.0+ or Vim 8 
Plugin 'jnurmine/Zenburn'
Plugin 'vim-scripts/peaksea'
Plugin 'https://github.com/tomasr/molokai'
Plugin 'tomasiser/vim-code-dark'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'https://github.com/joshdick/onedark.vim'
"Plugin 'https://github.com/Blevs/vim-dzo'
"Plugin 'https://github.com/wincent/command-t'
"Plugin 'klen/python-mode'
Plugin 'christoomey/vim-tmux-navigator' " ctr+hjkl navigation between splits
Plugin 'https://github.com/bfrg/vim-cuda-syntax' " cuda syntax highlight
Plugin 'https://github.com/bfrg/vim-cpp-modern' " Keyword and regex-based syntax highlighting for C and C++11/14/17/20

" Install FZF
set rtp+=~/.local/opt/fzf
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" Enable filetype plugins
filetype plugin on
filetype plugin indent on    " required

" Cuda highlight syntax options
" Highlight kernel calls in <<< >>>>
let g:cuda_kernel_highlight = 1

""" Vim Skin 
"colorscheme distinguished
"colorscheme dzo
" colorscheme zenburn
" set rtp+=~/.vim_runtime/plugins/my-onedark " for custonly installed my-onedark colorscheme from https://gist.githubusercontent.com/bfrg/dc149d1b797dd65502db38b1d76b5edd/raw/f75376c5affa38f3745ee0bf23ec2092a9aa757e/onedark.vim
" colorscheme onedark

try
    colorscheme peaksea
    "colorscheme molokai
    "colorscheme codedark
catch
endtry

"NERD Tree settings
autocmd StdinReadPre * let s:std_in=1
"autostart NerdTree
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
map <C-b> :NERDTreeFind<CR>

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


"Syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_loc_list_height=1
"let g:syntastic_python_checkers = ['flake8'] "don't use heavy checks
"let g:syntastic_python_flake8_args='--ignore=E501,E225'
""supress some messages
"let g:syntastic_quiet_messages = {
"    \ "!level":  "errors",
"    \ "type":    "style"}
noremap ]l :lnext<CR> 
noremap [l :lp<CR> 

function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         " No location/quickfix list shown, open syntastic error location panel
         lopen
    else
        lclose
    endif
endfunction

nmap <script> <silent> <C-q> :call ToggleErrors()<CR>
"
"pymode settings
let g:pymode_lint_ignore = "F401, E501"

" ALE settings
" Enable ALE status in Airline bar.
let g:airline#extensions#ale#enabled = 1
" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'pylint']
" Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5

let g:ycm_autoclose_preview_window_after_completion=1
"map <C-g>  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"""""""""""""""""""""""""""""
" FZF Plugin configuration
"""""""""""""""""""""""""""""
nmap <leader>s :vs<cr>:Files<cr>
nmap <leader>i :split<cr>:Files<cr>
nmap <leader>f :Files<cr>
command F :Files

"""""""""""""""""""""""""""""
" TagList Plugin Configuration
"""""""""""""""""""""""""""""
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
"map <C-q> :TlistToggle<CR>

"""""""""""""""""""""""""""""
" Easytags
"""""""""""""""""""""""""""""
" Let Vim walk up directory hierarchy from CWD to root looking for tags file
set tags=tags;/
" Tell EasyTags to use the tags file found by Vim
let g:easytags_dynamic_files = 1
let g:easytags_async = 1
