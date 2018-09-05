call plug#begin('~/.config/nvim/plug')

" Status line
" https://github.com/vim-airline/vim-airline
Plug 'bling/vim-airline'

" Autoformat tool
" https://github.com/Chiel92/vim-autoformat
Plug 'Chiel92/vim-autoformat'

" Fuzzy file finder
" https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'

" https://github.com/flazz/vim-colorschemes
Plug 'flazz/vim-colorschemes'

" GLSL support
" https://github.com/tikhomirov/vim-glsl
Plug 'tikhomirov/vim-glsl'

" File-type sensitive comments
" https://github.com/tomtom/tcomment_vim
Plug 'tomtom/tcomment_vim'

" Remap . for plugins
" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'

" Add surroundings
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" Rust language support
" https://github.com/rust-lang/rust.vim
Plug 'rust-lang/rust.vim'

" Typescript language support
" https://github.com/leafgarland/typescript-vim
Plug 'leafgarland/typescript-vim'

" Nerdtree
" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'

"SCSS language support
"https://github.com/cakebaker/scss-syntax.vim
Plug 'cakebaker/scss-syntax.vim'

call plug#end()

set t_Co=256            " set 256 color
colorscheme gruvbox     " define syntax color scheme
set background=dark     " adjust vim for dark colors
set cursorline          " show current cursor line
set cursorcolumn        " show current cursor column
set number              " show line numbers
set clipboard+=unnamed  " yank and copy to X clipboard
set shortmess+=I        " disable the welcome screen
let mapleader = ","     " map leader to ,
set backspace=2         " full backspacing capabilities
set hidden              " enable buffer switching without saving
set ww=<,>,[,]          " whichwrap -- left/right keys can traverse up/down
set scrolloff=3         " keep 2 lines spacing between cursor and edge
set expandtab           " insert spaces instead of tab chars
set tabstop=4           " a n-space tab width
set shiftwidth=4        " allows the use of < and > for VISUAL indenting
set softtabstop=4       " counts n spaces when DELETE or BCKSPCE is used
set autoindent          " auto indents next new line
set smarttab            " remember indent
set list                " show invis characters (out of place chars?)
set ignorecase          " case-insensitive search
set smartcase           " upper-case sensitive search

" Turn off search highlighting.
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>g :wq<CR>

" Open NerdTree automatically when no specific file is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Don't create a swap file
set noswapfile

" Remove trailing whitespaces.
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * %s/\s\+$//e

" Airline
" Enable powerline
let g:airline_powerline_fonts = 1
" display all buffers
let g:airline#extensions#tabline#enabled = 1

" Autoformat
" Map autoformat
noremap <leader>f :Autoformat<CR>
" Enable verbose output
let g:autoformat_verbosemode=1
" Disable fallback to vim defaults
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
" Define formatter tool commands.
let g:formatdef_clangformat = "'clang-format'"
let g:formatdef_rustformat= "'/usr/bin/rustfmt --write-mode display'"
" Map file types to formatters.
let g:formatters_opencl = ['clangformat']
let g:formatters_glsl = ['clangformat']
let g:formatters_rust = ['rustformat']

imap jk <Esc>
set clipboard+=unnamed "yank and copy to X clipboard"

" CtrlP
" use mixed search per default
let g:ctrlp_cmd = 'CtrlPMixed'
" set custom search command
let g:ctrlp_user_command = 'ag %s --files-with-matches -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
