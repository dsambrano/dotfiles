""" Plugins
call plug#begin()

" Functionalities - Python
Plug 'psf/black', { 'branch': 'stable' }
Plug 'heavenshell/vim-pydocstring'

" Aesthetics - Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'zaki/zazen'
Plug 'yuttie/hydrangea-vim'

" Aesthetics - Others
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'

call plug#end()


""" Main Configs 
syntax on
set relativenumber
set nu
set autoindent
set tabstop=4
set shiftwidth=4
set smartindent
set expandtab
set backspace=indent,eol,start
set signcolumn=yes
set scrolloff=8
set incsearch
set colorcolumn=80
set signcolumn=yes
set smartcase
set ignorecase
set nohlsearch
set incsearch


""" Keybinds
let mapleader=" "
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>$s <C-w>s<C-w>j:terminal<CR>:set nonumber norelativenumber<CR><S-a>
nmap <leader>$v <C-w>v<C-w>l:terminal<CR>:set nonumber norelativenumber<CR><S-a>

" Python
autocmd Filetype python nmap <leader>d <Plug>(pydocstring)
autocmd FileType python nmap <leader>p :Black<CR>
