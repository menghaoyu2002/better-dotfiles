call plug#begin()
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim' 
Plug 'nvim-lualine/lualine.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvimdev/dashboard-nvim'
Plug 'RRethy/vim-illuminate'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
Plug 'nvimdev/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpate'}

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'

Plug 'windwp/nvim-autopairs'
Plug 'folke/flash.nvim'
Plug 'kylechui/nvim-surround'
Plug 'tpope/vim-fugitive'
Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

" set variables
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
set number relativenumber
set ignorecase
set smartcase

" Custom Keybinds
inoremap kj <ESC>
let mapleader = " "
 
" Rebind undo to ctrl + z
nnoremap <C-z> u
inoremap <C-z> <C-o>u

" open new splits at the bottom right
set splitbelow
set splitright

" Vertical motions
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Split navigation
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>
nnoremap <C-h> <C-W><C-h>

" Split Resizing
nnoremap <C-w><C-L> :vertical res -5<CR>
nnoremap <C-w><C-H> :vertical res +5<CR>
noremap <C-w><C-K> :res -5<CR>
noremap <C-w><C-J> :res +5<CR>

" Split rearranging
nnoremap <C-r>l <C-w>r
nnoremap <C-r>h <C-w>R
nnoremap <C-r>e <C-w>x

" Buffer navigation
nnoremap <C-A-h> :bp<CR>
nnoremap <C-A-l> :bn<CR>
nnoremap <C-A-x> :bd<CR>

" NERDTree Keybinds
nnoremap <A-a> :NvimTreeFocus<CR>
nnoremap <A-d> :NvimTreeClose<CR>

" Telescope Keybinds
nnoremap <C-/> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ft <cmd>Telescope treesitter<cr>
nnoremap <leader>fs <cmd>Telescope spell_suggest<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>gb <cmd>Telescope git_bcommits<cr>

" Clear highlight from search
nnoremap <space>/ :noh<cr>

" LSP keybinds
nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <A-k> :Lspsaga peek_definition<CR>
nnoremap <A-r> :Lspsaga rename<CR>
nnoremap <A-o> :Lspsaga outline<CR>
nnoremap <C-A-,> :Lspsaga show_workspace_diagnostics<CR>
nnoremap <C-,> :Lspsaga show_buf_diagnostics<CR>
nnoremap ]d :Lspsaga diagnostic_jump_next<CR>
nnoremap [d :Lspsaga diagnostic_jump_prev<cr>
nnoremap <C-.> :Lspsaga code_action<cr>
nnoremap <A-f> :Lspsaga finder<cr>

" set theme
set termguicolors
colorscheme catppuccin

" one tab is four spaces, don't @ me
set expandtab
set tabstop=4
set shiftwidth=4

" highlight on yank
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=150})
augroup END

set pumheight=10

" without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <C-p> "_dP

" yank to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" import lua config
lua require("config")

