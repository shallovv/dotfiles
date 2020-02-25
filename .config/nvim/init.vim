" -- Tab --
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set ignorecase
set smartcase

" -- base --
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax on
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,sjis
set fileformats=unix,dos,mac
set ambiwidth=double
set clipboard+=unnamed
set number
set title
set hidden
set showmatch
set nowrapscan
set hlsearch
set wrap
set incsearch
set ruler
set showcmd
set history=2000
set sh=zsh
set laststatus=2
set wildmenu
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" -- keymap --
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap <Esc><Esc> :noh<CR>
