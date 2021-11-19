if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'nvie/vim-flake8'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-rails'
Plug 'lifepillar/vim-solarized8'
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'vim-airline/vim-airline'
Plug 'vim-ruby/vim-ruby'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'

call plug#end()

let maplocalleader=" "
let mapleader=" "
set updatetime=300
set clipboard=unnamed

" airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 0
let g:airline_section_b = ''
let g:airline_section_y = ''
let g:airline_section_z = ''

" ctrl p to file search
" nnoremap <c-p> :FZF -i<cr>
nnoremap <silent> <leader>m :History<CR>
" nnoremap <c-p> :Clap files<CR>
" nnoremap <silent> <leader>m :Clap history<CR>
" let g:clap_layout = { 'relative': 'editor' }
" let g:clap_theme = 'material_design_dark'
nnoremap <c-p> :Leaderf file<cr>
" let g:Lf_CommandMap = {'<C-V>': ['<D-v>']}

"gui settings
set guifont=DroidSansMono_Nerd_Font:h11

"set termguicolors
set background=dark
colorscheme solarized8

" 常规设定
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set encoding=UTF-8
set mouse=n
"set so=0
set number
set ruler
set nocompatible
syntax on
filetype plugin indent on
syntax enable
set nobackup  " 不要自动生成 ~ 结尾的备份文件

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

" 复制当前词
nmap <Leader>c bvey
nmap q :q<CR>

"NERDTREE配置
nmap <Leader>n <plug>NERDTreeTabsToggle<CR>
nmap <Leader>f :NERDTreeFind<CR>
let NERDTreeAutoCenter=1
let NERDTreeIgnore=['\.pyc','\~$','\.swp', '__pycache__', 'node_modules', '\.git'] "不显示这些文件
let NERDTreeWinSize=35 "设置宽度
"================================== end of NERDTREE配置 ==================================

" wrap word in quotation
nnoremap <silent> <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <silent> <leader>' viw<esc>a'<esc>hbi'<esc>lel

" reload vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

au BufNewFile,BufRead *.jsx,*.js setlocal shiftwidth=2 sts=2 et
au BufNewFile,BufRead *.rb,*.rbw,*.gemspec,*.rake setlocal shiftwidth=2 sts=2 et

nnoremap <localleader>s :Git blame<CR>
nnoremap vs :vsplit<CR>
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

if executable('ag')
  let g:ackprg = 'ag --hidden --vimgrep --ignore-dir .git --ignore-dir node_modules --ignore-dir sorbet --ignore-dir __generated__ --ignore RouteConstants.js --ignore routes.js'
endif

" don't auto jumt to the first result
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" cp to copy current file name
nmap cp :let @+ = expand("%")<CR>

" =========================== coc
nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
" ========================== end of Coc
