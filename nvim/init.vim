set nocompatible              " be iMproved, required

set guicursor=i:block

call plug#begin()
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
Plug 'numToStr/Comment.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvimdev/dashboard-nvim'
Plug 'RRethy/vim-illuminate'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'windwp/nvim-autopairs'
Plug 'phaazon/hop.nvim'
Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

set number
syntax on

" Custom Keybinds
inoremap kj <ESC>
 
" Rebind undo to ctrl + z
nnoremap <C-z> u
inoremap <C-z> <C-o>u

" open new splits at the bottom right
set splitbelow
set splitright

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
nnoremap <C-b>h :bp<CR>
nnoremap <C-b>l :bn<CR>
nnoremap <C-b>b :ls<CR>

" Close buffer 
nnoremap <C-b>x :bd<CR>

" NERDTree Keybinds
nnoremap <C-t> :NvimTreeToggle<CR>
nnoremap <C-f> :NvimTreeFocus<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" one tab is four spaces, don't @ me
set expandtab
set tabstop=4
set shiftwidth=4

set termguicolors
colorscheme catppuccin

lua require("config")

