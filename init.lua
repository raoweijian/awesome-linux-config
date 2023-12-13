local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require("lazy").setup({
    {
      "jackMort/ChatGPT.nvim",
      event = "VeryLazy",
      config = function()
        require("chatgpt").setup()
      end,
      dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      }
    },
    {
      "robitx/gp.nvim",
      config = function()
        require("gp").setup()
      end,
    },
    "scrooloose/nerdtree",
    "nvie/vim-flake8",
    "tpope/vim-sensible",
    "dyng/ctrlsf.vim",
    "lifepillar/vim-solarized8",
    "pangloss/vim-javascript",
    "sheerun/vim-polyglot",
    "vim-airline/vim-airline",
    "airblade/vim-gitgutter",
    "tpope/vim-fugitive",
    "neoclide/coc.nvim",
    "github/copilot.vim",
    "junegunn/fzf",
    "junegunn/fzf.vim",
    "ryanoasis/vim-devicons",
  })


vim.opt.compatible = false
vim.opt.updatetime = 300
vim.opt.clipboard = "unnamed"
vim.opt.wrap = false
vim.opt.guicursor = "i:block"

-- vim.opt.termencoding = "utf-8"
vim.opt.mouse = "n"
vim.opt.number = true
vim.opt.ruler = true
vim.opt.backup = false
vim.opt.background = "dark"
vim.opt.foldignore = ""
vim.cmd("silent! colorscheme solarized8")
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })


-- table 相关
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "indent"
vim.opt.cindent = true

vim.cmd("highlight Folded ctermfg=6 ctermbg=8")
vim.cmd("highlight WhitespaceEOL ctermbg=red guibg=red")
vim.cmd("match WhitespaceEOL /\\s\\+$/")
vim.cmd("au BufNewFile,BufRead *.jsx,*.js setlocal shiftwidth=2 sts=2 et")
vim.cmd("au BufNewFile,BufRead *.rb,*.rbw,*.gemspec,*.rake setlocal shiftwidth=2 sts=2 et")

-- 常用快捷键
vim.opt.pastetoggle = "<F9>"

vim.api.nvim_set_keymap("n", "<F3>", ":%s/\\s\\+$//<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<silent> <leader>\"", "viw<esc>a\"<esc>hbi\"<esc>lel", { noremap = true })
vim.api.nvim_set_keymap("n", "<silent> <leader>'", "viw<esc>a'<esc>hbi'<esc>lel", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>c", "bvey", { noremap = true })
vim.api.nvim_set_keymap("n", "q", ":q<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "w", ":w<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>sv", ":source $MYVIMRC<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "cp", ":let @+ = expand('%')<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "vs", ":vsplit<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>s", ":Git blame<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>_", "crse", { noremap = true })

-- -------------------------------------------------------------------------- airline
--  https://github.com/vim-airline/vim-airline
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#formatter"] = "unique_tail"
vim.g["airline_powerline_fonts"] = 0
vim.g["airline_highlighting_cache"] = 1
vim.g["airline_section_b"] = ""
vim.g["airline_section_z"] = ""

-- -------------------------------------------------------------------------- fzf
--  https://github.com/junegunn/fzf.vim
vim.api.nvim_set_keymap("n", "<C-p>", ":FZF -i<CR>", { noremap = true })

-- -------------------------------------------------------------------------- ctrlsf
--  https://github.com/dyng/ctrlsf.vim
vim.api.nvim_set_keymap("n", "<c-g>", ":CtrlSF<Space>", { noremap = true })
vim.g["ctrlsf_auto_close"] = { normal = 0, compact = 0 }

-- -------------------------------------------------------------------------- NERDTREE
vim.api.nvim_set_keymap("n", "<Leader>n", "<plug>NERDTreeTabsToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>f", ":NERDTreeFind<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>m", ":History<CR>", { noremap = true })
vim.g["NERDTreeAutoCenter"] = 1
vim.g["NERDTreeWinSize"] = 35

vim.g["javascript_plugin_jsdoc"] = 1
vim.g["javascript_plugin_flow"] = 1

-- -------------------------------------------------------------------------- coc
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gy", "<Plug>(coc-type-definition)", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]g", "<Plug>(coc-diagnostic-next)", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>rn", "<Plug>(coc-rename)", { noremap = true, silent = true })

vim.api.nvim_exec([[
    autocmd FileType python let b:coc_root_patterns = ['.git', '.env']
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
]], false)

vim.api.nvim_set_keymap("n", "<C-k>", ":ChatGPTEditWithInstruction<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-k>", ":ChatGPTEditWithInstruction<CR>", { noremap = true, silent = true })
