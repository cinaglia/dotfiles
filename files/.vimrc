set nocompatible               " be iMproved
set autoread
set timeoutlen=500
set splitright
set splitbelow
set lazyredraw

" Enable syntax
syntax on

" Detect file types
filetype plugin indent on

" Init vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  [ 'NERDTreeToggle','NERDTreeFind' ] }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-scripts/Enter-Indent'
Plug 'flazz/vim-colorschemes'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-commentary', { 'on': '<Plug>Commentary' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'christoomey/vim-tmux-navigator'
Plug 'townk/vim-autoclose'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-emoji'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'lfilho/cosco.vim'
Plug 'terryma/vim-expand-region'
Plug 'justinmk/vim-sneak'
Plug 'craigemery/vim-autotag'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-after-object'
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'junegunn/vim-slash'

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
set laststatus=2                "Always show status line"

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

" =================== Custom =======================
colorscheme monokain
set t_ut=
nnoremap <leader>u :GundoToggle<CR>

xmap gc  <Plug>Commentary
nmap gc  <Plug>Commentary
omap gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine
nmap cgc <Plug>ChangeCommentary
nmap gcu <Plug>Commentary<Plug>Commentary

map <C-n> :NERDTreeToggle<CR>
map <leader>n :NERDTreeFind<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set foldmethod=indent
set foldlevel=99
nnoremap <space> za

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd BufEnter * set updatetime=750
autocmd FileType python,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType javascript UltiSnipsAddFiletypes javascript-jasmine
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" 80-character limit
if exists('+colorcolumn')
  set colorcolumn=80
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif

" Gitgutter
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
let g:syntastic_python_checkers = ['flake8']

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

" Cosco
autocmd FileType javascript,css nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" vim-json
let g:vim_json_syntax_conceal = 0

" Perhaps this will help :)
map <left> :echo "no!"<cr>
map <right> :echo "no!"<cr>
map <up> :echo "no!"<cr>
map <down> :echo "no!"<cr>

" FZF mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
nnoremap <silent> <c-x><c-p> :History<cr>
nnoremap <silent> <leader>t :Tags<cr>
nnoremap <silent> <leader>b :BTags<cr>
nnoremap <silent> <leader>ag :Ag<cr>
nnoremap <silent> <leader><Leader> :Files<cr>
nnoremap <silent> <leader><Enter> :Buffers<cr>

let g:fzf_files_options =
  \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" Custom colors
hi Normal ctermbg=none
hi NonText ctermbg=none

" clear search
nnoremap <CR> :noh<CR><CR>

" easy edit/reload
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" pane expansion
nnoremap <C-W>M <C-W>\| <C-W>_
nnoremap <C-W>m <C-W>=

" vim-after-object
autocmd VimEnter * call after_object#enable('=', ':', ' ')

" tagbar
nnoremap <silent> <leader>f :TagbarToggle<cr>

" lightline
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'filename', 'modified' ],
  \             [ 'tagbar' ] ]
  \ },
  \ 'component': {
  \   'tagbar': '%{tagbar#currenttag("[%s]", "", "f")}',
  \ },
  \ }

" vim slash
noremap <plug>(slash-after) zz
