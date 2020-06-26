if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/taglist.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-rails'
Plug 'lifepillar/vim-solarized8'
Plug 'chemzqm/vim-jsx-improve'
Plug 'flowtype/vim-flow'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-ruby/vim-ruby'
Plug 'airblade/vim-gitgutter'
Plug 'rking/ag.vim'
Plug 'zivyangll/git-blame.vim'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'

call plug#end()

let maplocalleader=" "
let mapleader=" "
set updatetime=300
set clipboard=unnamed
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
nnoremap <silent> <leader>m :History<CR>

"set termguicolors
set background=dark
colorscheme solarized8

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

" ctrl p to fzf
nnoremap <c-p> :FZF<cr>

" table 键设定相关
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set backspace=indent,eol,start
set hlsearch
set autoindent  "自动缩进
set foldlevelstart=99
set fdm=indent " 按缩进折叠
set cindent " c风格的缩进
highlight Folded ctermfg=6 ctermbg=8
set pastetoggle=<F9> " F9 开关进入粘贴模式

"按F3删除所有末尾多余的空格
nnoremap <F3> :% s/\s\+$// <CR>

"按F4重新打开语法高亮，用于某些时候 vim 高亮显示出现 bug
nnoremap <F4> :syntax on <CR>

"显示行尾空格
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

"NERDTREE配置
nmap <Leader>n <plug>NERDTreeTabsToggle<CR>
nmap <Leader>f :NERDTreeFind<CR>
let NERDTreeAutoCenter=1
let NERDTreeIgnore=['\.pyc','\~$','\.swp', '__pycache__', 'node_modules', '\.git'] "不显示这些文件
let NERDTreeWinSize=35 "设置宽度
"================================== end of NERDTREE配置 ==================================


" 保存文件时自动检测 flake8
" autocmd BufWritePost *.py call Flake8()

" flow
let g:flow#flowpath = '/Users/weijianrao/code/flexport/node_modules/flow-bin/flow-osx-v0.126.0/flow'
let g:flow#enable = 1
let g:flow#showquickfix = 0

" wrap word in quotation
nnoremap <silent> <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <silent> <leader>' viw<esc>a'<esc>hbi'<esc>lel

" reload vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

au BufNewFile,BufRead *.jsx setlocal shiftwidth=2 sts=2 et
au BufNewFile,BufRead *.jsx nmap <buffer> <leader>g :FlowJumpToDef<CR>

au BufNewFile,BufRead *.rb,*.rbw,*.gemspec,*.rake setlocal shiftwidth=2 sts=2 et
au BufNewFile,BufRead *.rb,*.rbw,*.gemspec,*.rake nmap <buffer> <leader>g <C-]>

" let g:ale_linters = {'javascriptreact': ['flow-language-server', 'eslint']}

nnoremap <localleader>s :<C-u>call gitblame#echo()<CR>
