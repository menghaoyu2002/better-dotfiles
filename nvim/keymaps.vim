let mapleader = " "

" set variables
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
set number relativenumber
set ignorecase
set smartcase

" Custom Keybinds
inoremap kj <ESC>
 
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
nnoremap <A-w>l <A-w>r
nnoremap <A-w>h <A-w>R
nnoremap <A-w>e <A-w>x

" Buffer navigation
nnoremap <C-A-h> :bp<CR>
nnoremap <C-A-l> :bn<CR>
nnoremap <C-A-d> :bd<CR>

" Clear highlight from search
nnoremap <space>/ :noh<cr>

nnoremap <A-n> G
nnoremap <A-p> gg

nnoremap H ^
nnoremap L $

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
vnoremap <leader>p "_dP

" yank to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
