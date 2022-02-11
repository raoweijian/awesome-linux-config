if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'nvie/vim-flake8'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'tpope/vim-sensible'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
Plug 'dyng/ctrlsf.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
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
"set so=0
set number
set ruler
set nobackup
set background=dark
colorscheme solarized8
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
"let g:airline_section_a = ''
let g:airline_highlighting_cache=1
let g:airline_section_b = ''
" let g:airline_section_y = ''
let g:airline_section_z = ''

" -------------------------------------------------------------------------- vim-clap
"  https://github.com/liuchengxu/vim-clap
let g:clap_layout = { 'relative': 'editor' }
nnoremap <silent> <leader>m :History<CR>
" nnoremap <C-p> :Clap files<CR>
" nnoremap <leader>g :Clap grep<CR>
" nnoremap <silent> <leader>m :Clap history<CR>
" let g:clap_theme = 'material_design_dark'

" -------------------------------------------------------------------------- LeaderF
" nmap <C-p> :Leaderf file --case-insensitive<cr>
" nmap <C-s> :Leaderf mru <cr>
let g:Lf_PreviewInPopup = 1

" -------------------------------------------------------------------------- fzf
"  https://github.com/junegunn/fzf.vim
function! Fzf_files_with_dev_icons(command)
    let l:fzf_files_options = '-i --preview "bat --color always --style numbers {2..} | head -'.&lines.'"'
    function! s:edit_devicon_prepended_file(item)
        let l:file_path = a:item[4:-1]
        execute 'silent e' l:file_path
    endfunction
    call fzf#run({
                \ 'source': a:command.' | devicon-lookup',
                \ 'sink':   function('s:edit_devicon_prepended_file'),
                \ 'options': '-m ' . l:fzf_files_options,
                \ 'down':    '40%' })
endfunction
nmap <C-p> :FZF -i<CR>
" nnoremap <C-p> :call Fzf_files_with_dev_icons($FZF_DEFAULT_COMMAND)<CR>

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
let NERDTreeWinSize = 35 "设置宽度

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

" autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd FileType python let b:coc_root_patterns = ['.git', '.env']

" -------------------------------------------------------------------------- LanguageClient
" let g:LanguageClient_serverCommands = {
"     \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"     \ 'python': ['/usr/local/bin/pyls'],
"     \ 'ruby': ['/Users/weijianrao/.rvm/gems/ruby-2.7.3/bin/solargraph', 'stdio'],
"     \ }
"
" " note that if you are using Plug mapping you should not use `noremap` mappings.
" nmap <F5> <Plug>(lcn-menu)
" " Or map each action separately
" nmap <silent>K <Plug>(lcn-hover)
" nmap <silent> gd <Plug>(lcn-definition)
" nmap <silent> <F2> <Plug>(lcn-rename)
