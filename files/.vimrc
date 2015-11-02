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
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'christoomey/vim-tmux-navigator'
Plug 'townk/vim-autoclose'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-emoji'
Plug 'mattn/emmet-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'lfilho/cosco.vim'

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

" =================== Search ========================
set incsearch
set hlsearch

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

map gc <Plug>Commentary
map gcc <Plug>CommentaryLine

set foldmethod=indent
set foldlevel=99
nnoremap <space> za

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd BufEnter * set updatetime=750
autocmd FileType python,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType javascript UltiSnipsAddFiletypes javascript-jasmine

" 80-character limit
if exists('+colorcolumn')
  set colorcolumn=80
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif

" Gitgutter
let g:gitgutter_highlight_lines = 1
silent! if emoji#available()
    let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
    let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
    let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
    let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif

" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let s:eslint_path = system('npm-which eslint')
let b:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1

silent! if emoji#available()
    hi Error ctermbg=NONE
    let g:syntastic_error_symbol = emoji#for('no_entry')
    let g:syntastic_style_error_symbol = emoji#for('exclamation')
    let g:syntastic_warning_symbol = emoji#for('warning')
    let g:syntastic_style_warning_symbol = emoji#for('grey_exclamation')
endif

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Indent guides
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=235
autocmd VimEnter * :IndentGuidesEnable

" Cosco
autocmd FileType javascript,css nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" Perhaps this will help :)
map <left> :echo "no!"<cr>
map <right> :echo "no!"<cr>
map <up> :echo "no!"<cr>
map <down> :echo "no!"<cr>
