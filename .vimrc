set nu
" 每行缩进的空格数
"set sw=4
"一个tab四个空格
set ts=4
"  自动缩进
set expandtab
set autoindent

"======================
"   空格滚屏 "
"======================
map <space> <c-e>j


" 当你的backspacing键无效时可以配置此项
" more powerful backspacing
set backspace=indent,eol,start

"====================
"   1.General
"====================
"set to auto read when a file is changed fromn the outside
set autoread


" show matching bracets
set showmatch

" hightlight search things
set hlsearch

" 显示tab
" set list
" tab符号，显示为>--
" set listchars=tab:>-,trail:-



"=========================
"    paster format
"=========================
set pastetoggle=<F9>


"=========================
""       4. others
"=========================
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Auto_Highlight_Tag=1
let Tlist_Auto_Update=1
let Tlist_Display_Tag_Scope=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Enable_Dold_Column=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Use_SingleClick=1
let Tlist_WinWidth=40
"绑定F8快捷键
"使用winmanager时，不使用快捷键
nnoremap <silent> <F8> :TlistToggle<CR>
"启动Vim后 ，自动打开taglist窗口
"使用winmanager时，将自动打开窗口关闭
let Tlist_Auto_Open = 0

"============================================
"   SuperTab
"============================================
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType ="context"


" ==========================
" Plug
" https://github.com/junegunn/vim-plug
" ==========================
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
"Plug 'ycm-core/YouCompleteMe'
" NERDTree
" Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'
" code synstatic
" go
Plug 'fatih/vim-go'

call plug#end()


"========================
" NerdTree config
"========================
"autocmd VimEnter * NERDTree
" 如果仅有NERDTree在vim中，则自动退出
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
" 是否显示隐藏文件
"let NERDTreeShowHidden=1
"该本令仅支持打开NERDTree操作，已弃用
"nnoremap <silent> <F7> :NERDTree<CR>
" 将NERDTree的打开关闭映射到同一按键上
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>


"=====================================
" winmanager配置
"============================================
let g:NERDTree_title='NERDTree'
let g:winManagerWindowLayout='NERDTree|TagList'
let g:winManagerWidth = 40
colorscheme monokai

function! NERDTree_Start()
    "执行一个退出命令，关闭自动出现的窗口
    exec 'q'
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

nmap wm :WMToggle<cr>
"绑定F6到winmanager
nmap <silent> <F6> :WMToggle<cr>

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
