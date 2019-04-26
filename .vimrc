if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Valloric/YouCompleteMe'
Plug 'nvie/vim-flake8'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/taglist.vim'

call plug#end()


" 常规设定
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set mouse=n
set so=7
set number
set ruler
set nocompatible
syntax on
filetype plugin indent on
syntax enable
set nobackup  " 不要自动生成 ~ 结尾的备份文件


" table 键设定相关
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set backspace=indent,eol,start
set hlsearch
set autoindent  "自动缩进
set cindent " c风格的缩进
set fdm=indent " 按缩进折叠
highlight Folded ctermfg=6 ctermbg=8
set pastetoggle=<F9> " F9 开关进入粘贴模式
nmap <F3> :% s/\s\+$// <CR> "按F3删除所有末尾多余的空格
nmap <F4> :syntax on <CR>   "按F4重新打开语法高亮，用于某些时候 vim 高亮显示出现 bug


"显示行尾空格
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/


"NERDTREE配置
map <Leader>n <plug>NERDTreeTabsToggle<CR>
let NERDTreeAutoCenter=1
let NERDTreeIgnore=['\.pyc','\~$','\.swp', '__pycache__', 'node_modules'] "不显示这些文件
let NERDTreeWinSize=35 "设置宽度
let g:nerdtree_tabs_open_on_console_startup=1  " 在终端启动vim时，共享NERDTree
"================================== end of NERDTREE配置 ==================================


"CTRLP配置
set runtimepath^=~/.vim/plugged/ctrlp.vim
let g:ctrlp_working_path_mode = ''
let g:ctrlp_by_filename = 1 "默认使用文件名搜索，不使用目录
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|venv|node_modules|dist)$',
    \ 'file': '\v\.(exe|so|dll|class)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
"================================== end of CTRLP配置 ==================================


"taglist
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1     "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1   "如果taglist窗口是最后一个窗口，则退出vim
map <F5> :TlistToggle<CR>

"ycm配置
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_python_binary_path = 'python3'
"let g:ycm_global_ycm_extra_conf='/home/raoweijian/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_key_list_stop_completion = ['<CR>']
let g:ycm_goto_buffer_command = 'new-or-existing-tab'
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_semantic_triggers =  {
  \   'c': ['->', '.'],
  \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \            're!\[.*\]\s'],
  \   'ocaml': ['.', '#'],
  \   'cpp,cuda,objcpp': ['->', '.', '::'],
  \   'perl': ['->'],
  \   'php': ['->', '::'],
  \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
  \   'ruby,rust': ['.', '::'],
  \   'lua': ['.', ':'],
  \   'erlang': [':'],
  \ }

" jedi-vim 配置
let g:jedi#show_call_signatures = 0
let g:jedi#completions_command = "<C-N>"
let g:jedi#auto_close_doc = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#completions_enabled = 0
"let g:jedi#popup_select_first = 0
"set completeopt-=preview
"set completeopt-=longest

" 保存文件时自动检测 flake8
autocmd BufWritePost *.py call Flake8()
