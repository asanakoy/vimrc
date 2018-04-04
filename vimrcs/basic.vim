" Включаем несовместимость настроек с Vi (ибо Vi нам и не понадобится).
set nocompatible
filetype off

abbr teh the

let mapleader=" "

" Включает виртуальный звонок (моргает, а не бибикает при ошибках)
set visualbell
" Скрыть панель в gui версии ибо она не нужна
" set guioptions-=T

"" РАБОТА С ФАЙЛАМИ
" Add the unnamed register to the clipboard
set clipboard=unnamedplus
" Список кодировок файлов для автоопределения
set fileencodings=utf-8,cp1251,koi8-r,cp866

" Отключаем создание бэкапов
set nobackup
" Отключаем создание swap файлов
set noswapfile
" Не выгружать буфер, когда переключаемся на другой
set hidden
" Set to auto read when a file is changed from the outside
set autoread

"Exclude these files from im search
set wildignore=*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg,*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Включаем отображение дополнительной информации в статусной строке
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %l,%c%V\ %P
" Всегда отображать статусную строку для каждого окна
set laststatus=2
" Включаем отображение выполняемой в данный момент команды в правом нижнем углу экрана.
set showcmd
" Height of the command bar
set cmdheight=2
" Сделать строку команд высотой в одну строку
set ch=1

"" ПОИСК
" Highlight search results
set hlsearch
" При поиске перескакивать на найденный текст в процессе набора строки
set incsearch
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line  breaks and warping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Включаем перенос строк
set wrap
" set linebreak
" set showbreak=…             " show ellipsis at breaking

" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Преобразование Таба в пробелы
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 Tab = 4 spaces
set tabstop=4
" Размер сдвига при нажатии на клавиши << и >>
set shiftwidth=4
" Включаем 'умную' автоматическую расстановку отступов
set smartindent
" Копирует отступ от предыдущей строки
set autoindent
set cindent

set number                  " line numbers
set relativenumber          " show relative line numbers
" Показывать положение курсора всё время.
set ruler

"НАСТРОЙКИ СВОРАЧИВАНИЯ БЛОКОВ КОДА (фолдинг)
"set foldenable " включить фолдинг
set nofoldenable " do not fold
"set foldmethod=syntax " определять блоки на основе синтаксиса файла
"set foldcolumn=3 " показать полосу для управления сворачиванием
"let perl_folding=1 " правильное сворачивание классов и функций Perl
"let php_folding=1 " правильное сворачивание классов и функций PHP
"set foldlevel=1 " Первый уровень вложенности открыт, остальные закрыты
"set foldopen=all " автоматическое открытие сверток при заходе в них

"" АВТОЗАВЕРШЕНИЕ СКОБ
" Показыватть первую скобу когда печататаешь вторую
"set showmatch
" Редко когда надо [ без пары =)
"imap [ []

" Проверка орфографии -->
if version >= 700
" По умолчанию проверка орфографии выключена
set spell spelllang=
set nospell

menu Spell.off :setlocal spell spelllang=:setlocal nospell
menu Spell.Russian+English :setlocal spell spelllang=ru,en
menu Spell.Russian :setlocal spell spelllang=ru
menu Spell.English :setlocal spell spelllang=en
menu Spell.-SpellControl- :
menu Spell.Word\ Suggestz= z=
menu Spell.Add\ To\ Dictionaryzg zg
menu Spell.Add\ To\ TemporaryDictionaryzG zG
menu Spell.Remove\ From\ Dictionaryzw zw
menu Spell.Remove\ From\ Temporary\ DictionaryzW zW
menu Spell.Previous\ Wrong\ Word[s [s
menu Spell.Next\ Wrong\ Word]s ]s
endif
" Проверка орфографии <--

" Make the command-line completion better
set wildmenu


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Включаем подсветку синтаксиса
let python_highlight_all=1
syntax on

"let g:solarized_termcolors=16
"set t_Co=256
" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Set colorscheme and background
set background=dark


"colorscheme distinguished
"colorscheme dzo
" colorscheme zenburn
try
    colorscheme peaksea
catch
endtry

set encoding=utf-8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext<cr> 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

 " Disable arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"Disable annoying keys
noremap <PageUp> <NOP>
noremap <PageDown> <NOP>
imap <PageUp> <NOP>
imap <PageDown> <NOP>

" Select from a jump list
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction
nmap <Leader>j :call GotoJump()<CR>


" open new splits down and to the right
set splitbelow
set splitright


"au BufNewFile,BufRead *.cpp set syntax=cpp11

"compile and run
"   nmap: Create a normal-mode mapping
"   <F5>: for F5 (other function keys are available)
"   <C-U>: clear the command-line
"   make: call 'makeprg', which is make by default
"   %:r: root of the current filename (extension removed)
"   <CR>: execute all this
nmap <F5> :<C-U>!g++ % -std=c++11 -o2 -o %:r && ./%:r<CR>
nmap <F6> :<C-U>!g++ -DHOME % -std=c++11 -o2 -o %:r.o2 && ./%:r.o2<CR>
nmap <F7> :<C-U>!g++ -DHOME -g % -o %:r.g && ./%:r.g<CR>
autocmd FileType python nnoremap <F9> :<C-U>!python %<CR>

set pastetoggle=<F4>
map <F2> :A<CR>

"Brackets autocomplete
let s:pairs={
            \'<': '>',
            \'{': '}',
            \'[': ']',
            \'(': ')',
            \'«': '»',
            \'„': '“',
            \'“': '”',
            \'‘': '’',
        \}
call map(copy(s:pairs), 'extend(s:pairs, {v:val : v:key}, "keep")')
function! InsertPair(left, ...)
    let rlist=reverse(map(split(a:left, '\zs'), 'get(s:pairs, v:val, v:val)'))
    let opts=get(a:000, 0, {})
    let start   = get(opts, 'start',   '')
    let lmiddle = get(opts, 'lmiddle', '')
    let rmiddle = get(opts, 'rmiddle', '')
    let end     = get(opts, 'end',     '')
    let prefix  = get(opts, 'prefix',  '')
    let start.=prefix
    let rmiddle.=prefix
    let left=start.a:left.lmiddle
    let right=rmiddle.join(rlist, '').end
    let moves=repeat("\<Left>", len(split(right, '\zs')))
    return left.right.moves
endfunction
 "noremap! <expr> {   InsertPair('{')
 "noremap! <expr> [   InsertPair('[')
 "noremap! <expr> (   InsertPair('(')
 "noremap! <expr> "   InsertPair('"')
 "noremap! <expr> '   InsertPair("'")
 inoremap {<CR> {<C-o>o}<C-o>O


" Remap VIM 0 to first non-blank character
" map 0 ^


" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.cpp,*.c :call CleanExtraSpaces()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry


" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>  <C-U>
