call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-sensible'
Plug 'dyng/ctrlsf.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" -------------------------------------------------------------------------- normal config
set nocompatible
set updatetime=300
set clipboard=unnamed
set nowrap
set guicursor=i:block
set guifont=Consolas_NF:h16
set termencoding=utf-8
set mouse=n
set number
set ruler
set nobackup
set background=dark
" colorscheme solarized8
let maplocalleader=" "
let mapleader=" "

" table 相关
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set foldlevelstart=99
set fdm=indent
set cindent
highlight Folded ctermfg=6 ctermbg=8
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

au BufNewFile,BufRead *.jsx,*.js setlocal shiftwidth=2 sts=2 et
au BufNewFile,BufRead *.rb,*.rbw,*.gemspec,*.rake setlocal shiftwidth=2 sts=2 et

" 常用快捷键
set pastetoggle=<F9>
nnoremap <F3> :% s/\s\+$// <CR>
nnoremap <silent> <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <silent> <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <Leader>c bvey
nnoremap q :q<CR>
nnoremap w :w<CR>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap cp :let @+ = expand("%")<CR>
nnoremap vs :vsplit<CR>
nnoremap <localleader>s :Git blame<CR>

" -------------------------------------------------------------------------- airline
"  https://github.com/vim-airline/vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 0
let g:airline_highlighting_cache=1
let g:airline_section_b = ''
let g:airline_section_z = ''


" -------------------------------------------------------------------------- fzf
"  https://github.com/junegunn/fzf.vim
nmap <C-p> :FZF -i<CR>


" -------------------------------------------------------------------------- ctrlsf
"  https://github.com/dyng/ctrlsf.vim
nnoremap <c-g> :CtrlSF<Space>
let g:ctrlsf_auto_close = {
            \ "normal" : 0,
            \ "compact": 0
            \}


" -------------------------------------------------------------------------- NERDTREE
nmap <Leader>n <plug>NERDTreeTabsToggle<CR>
nmap <Leader>f :NERDTreeFind<CR>
let NERDTreeAutoCenter = 1
let NERDTreeIgnore = ['\.pyc','\~$','\.swp', '__pycache__', 'node_modules', '\.git']
let NERDTreeWinSize = 35

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1


" -------------------------------------------------------------------------- coc
nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>rn <Plug>(coc-rename)

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

autocmd FileType python let b:coc_root_patterns = ['.git', '.env']
