set nocompatible               " be iMproved
set autoread 

" Enable syntax
syntax on

" Comma is the leader key
let mapleader = ','

" Detect file types
filetype plugin indent on

" Init vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'flazz/vim-colorschemes'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-commentary', { 'on': '<Plug>Commentary' }
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'mhinz/vim-signify'

call plug#end()

" ================ General Config ====================
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set cursorline                  "Highlight current line
set wildmenu                    "Autocomplete for command menu

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

if has('gui_running')
   set background=light
else
   set background=dark
endif


" =================== Custom =======================
colorscheme badwolf
set t_ut=
nnoremap <leader>u :GundoToggle<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> <Leader><Enter> :Buffers<CR>

map  gc  <Plug>Commentary
map  gcc  <Plug>CommentaryLine

set foldmethod=indent
set foldlevel=99
nnoremap <space> za
