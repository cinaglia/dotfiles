set nocompatible               " be iMproved
set autoread 

" Enable syntax
syntax on

" Comma is the leader key
let mapleader = ','

" Init vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-commentary'
Plugin 'tomtom/tcomment_vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'tpope/vim-surround'
Plugin 'jeetsukumaran/vim-indentwise'

call vundle#end()

" Detect file types
filetype plugin indent on

" ================ General Config ====================
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" ================ Turn Off Swap Files ==============
"
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
