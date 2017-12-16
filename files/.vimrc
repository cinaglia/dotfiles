set nocompatible
set autoread
set timeoutlen=500
set ttimeoutlen=0
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
Plug 'tpope/vim-commentary', { 'on': '<Plug>Commentary' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-projectionist'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-emoji'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'craigemery/vim-autotag'
Plug 'junegunn/vim-peekaboo'
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-submode'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'machakann/vim-textobj-functioncall'
Plug 'bkad/CamelCaseMotion'
Plug 'wellle/targets.vim'
Plug 'junegunn/vim-after-object'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'junegunn/vim-slash'
Plug 'blueyed/vim-diminactive'
Plug 'tommcdo/vim-exchange'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'naberon/vim-cakehtml'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/dsf.vim'
Plug 'AndrewRadev/multichange.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'kshenoy/vim-signature'
Plug 'easymotion/vim-easymotion'
Plug 'shofel/syntastic-local-js-checkers'
Plug 'editorconfig/editorconfig-vim'
Plug 'matze/vim-move'

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

map q: :q
nnoremap <space> zz
nnoremap <leader>w :w!<cr>
nnoremap <leader>wq :wq!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>e :e!<cr>

nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_
nnoremap Y y$

" previous buffer
nnoremap <leader>T <c-^>

" vim-commentary
xmap gc  <Plug>Commentary
nmap gc  <Plug>Commentary
omap gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine
nmap cgc <Plug>ChangeCommentary
nmap gcu <Plug>Commentary<Plug>Commentary

" nerdtree
let NERDTreeMapOpenVSplit = '<C-v>'
map <C-n> :NERDTreeToggle<CR>zz:DimInactive<CR>

function! NERDTreeFindToggle()
  if exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
    execute ":NERDTreeClose"
  else
    execute ":NERDTreeFind"
  endif
endfunction
nnoremap <silent> <leader>n :call NERDTreeFindToggle()<cr>zz:DimInactive<CR>

" fold
set foldmethod=indent
set foldlevel=99

" filetype specific configuration
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd BufEnter * set updatetime=750
autocmd FileType python,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType python let b:delimitMate_nesting_quotes = ['"']
autocmd FileType javascript UltiSnipsAddFiletypes javascript-jasmine
autocmd Filetype javascript,php,python setlocal ts=4 sts=4 sw=4
autocmd Filetype php set cul!
autocmd BufNewFile,BufRead *.thtml setlocal filetype=htmlcake

" 80-character limit
if exists('+colorcolumn')
  " set colorcolumn=80
  let &colorcolumn=join(range(81, 254),",")
endif

" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['html', 'scss', 'css'] }
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
autocmd FileType html,css,javascript.jsx EmmetInstall

" vim-json
let g:vim_json_syntax_conceal = 0

" vim-markdown
let g:vim_markdown_conceal = 0

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
nnoremap <silent> <leader>m :Marks<cr>
nnoremap <silent> <leader>ag :Ag<cr>
nnoremap <silent> <leader><Leader> :Files<cr>
nnoremap <silent> <leader>B :Buffers<cr>

let g:fzf_files_options =
  \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" Custom background colors
hi Normal ctermbg=none
hi NonText ctermbg=none
hi ColorColumn ctermbg=235
hi Visual ctermbg=26

" clear search
nnoremap <CR> :noh<CR><CR>

" easy edit/reload
nmap <leader>ev :e $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>

" pane zoom
function! ToggleZoom()
  let threshold = 0.95
  let width_ratio = winwidth(0) / str2float(&columns)
  let height_ratio = winheight(0) / str2float(&lines)
  let is_maximized =  width_ratio > threshold && height_ratio > threshold
  if is_maximized == 1
    execute "normal \<C-W>\="
  else
    execute "normal \<C-W>\| \<C-W>\_"
  endif
endfunction
nnoremap <silent> <leader>z :call ToggleZoom()<cr>

" vim-after-object
autocmd VimEnter * call after_object#enable('=', ':', ' ')

" lightline
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'relativepath', 'modified' ],
  \             [ 'tagbar' ] ]
  \ },
  \ 'component': {
  \   'tagbar': '%{tagbar#currenttag("[%s]", "", "f")}',
  \ },
  \ }

" vim slash
noremap <plug>(slash-after) zz

" camel-case motion
call camelcasemotion#CreateMotionMappings(',')

" vim-fugitive
noremap <leader>gb :Gblame<cr>

" tab navigation
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" backspace
nnoremap <BS> i<BS>
nnoremap <leader><BS> mx$"_x`x

" copy/paste mappings
nnoremap <leader>y "+y
vnoremap <leader>y "+y
vnoremap <leader>p "+p
nnoremap <leader>p "+p
vnoremap <leader>P "+P
nnoremap <leader>P "+P
vnoremap <leader>r "_dP
nnoremap <leader>r "_dP

" reselect visual block
vnoremap < <gv
vnoremap > >gv

" insert one character and stay in normal mode
nnoremap <leader>i i_<esc>r

" replace current character with a line break
nnoremap <silent> <leader><enter> r<cr>

" increment number under cursor
noremap <leader>a <C-a>

" redraw vim before swiching tmux panes
autocmd VimEnter * nnoremap <silent> <c-j> :TmuxNavigateDown<cr>:redraw!<cr>
autocmd VimEnter * nnoremap <silent> <c-l> :TmuxNavigateRight<cr>:redraw!<cr>

" resize split when window is resized
:autocmd VimResized * wincmd =

" easier pane resizing
call submode#enter_with('resize', 'n', '', '<leader>H', '<c-w>5<')
call submode#enter_with('resize', 'n', '', '<leader>L', '<c-w>5>')
call submode#enter_with('resize', 'n', '', '<leader>J', '<c-w>5-')
call submode#enter_with('resize', 'n', '', '<leader>K', '<c-w>5+')
call submode#map('resize', 'n', '', 'H', '<c-w>5<')
call submode#map('resize', 'n', '', 'L', '<c-w>5>')
call submode#map('resize', 'n', '', 'J', '<c-w>5-')
call submode#map('resize', 'n', '', 'K', '<c-w>5+')

" sideways
nnoremap gh :SidewaysLeft<cr>
nnoremap gl :SidewaysRight<cr>
autocmd FileType javascript.jsx let b:sideways_definitions = [
	\   {
	\     'start':                   '<\k\+\_s\+',
	\     'end':                     '\s*/\?>',
	\     'delimited_by_whitespace': 1,
	\     'brackets':                ['"''', '"'''],
	\   },
	\ ]

" switch
let g:toggle_semicolon = [{ '^\(.*[^;,]\)$': '\1;', '^\(.*\),$': '\1;', '^\(.*\);$': '\1' }]
let g:toggle_comma = [{ '^\(.*[^;,]\)$': '\1,', '^\(.*\);$': '\1,', '^\(.*\),$': '\1' }]
nnoremap ,, :call switch#Switch({'definitions': g:toggle_comma})<cr>
imap ,, <esc>:call switch#Switch({'definitions': g:toggle_comma})<cr>a
nnoremap ;; :call switch#Switch({'definitions': g:toggle_semicolon})<cr>
imap ;; <esc>:call switch#Switch({'definitions': g:toggle_semicolon})<cr>a

" jasmine switch definitions
autocmd FileType javascript let b:switch_custom_definitions =
  \ [
  \   {
  \     '^\(\s*\)describe\(.*\)': '\1fdescribe\2',
  \     '^\(\s*\)fdescribe\(.*\)': '\1describe\2',
  \     '^\(\s*\)it\(.*\)': '\1fit\2',
  \     '^\(\s*\)fit\(.*\)': '\1it\2',
  \   },
  \ ]

" gitcommit switch definitions
autocmd FileType gitcommit let b:switch_custom_definitions =
  \ [
  \   {
  \     '\(\w*-\d*\)': '[\1](https://jira.aweber.io/browse/\1)',
  \   },
  \ ]

" reopen last buffer
nmap <c-t> :vs<bar>:b#<CR>

" easymotion
map <leader> <Plug>(easymotion-prefix)
map <Leader>l <Plug>(easymotion-bd-jk)
map  <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)

let g:move_key_modifier = 'C'
