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
let g:python_host_prog = '~/.pyenv/versions/nvim-python2/bin/python'
let g:python3_host_prog = '~/.pyenv/versions/nvim-python3/bin/python'
let g:ruby_host_prog = '~/.rbenv/versions/3.0.0/bin/neovim-ruby-host'
let g:node_host_prog = '~/node_modules/.bin/neovim-node-host'

" -- keymap --
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap <Esc><Esc> :noh<CR>

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/shallovv/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/shallovv/.cache/dein')
  call dein#begin('/Users/shallovv/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/shallovv/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#add('itchyny/lightline.vim')
  call dein#add('arcticicestudio/nord-vim')
  call dein#add('tpope/vim-fugitive.git')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
"syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" statusline
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modfied' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead'
  \ },
  \ }

" colorscheme
colorscheme nord
set cursorline
let g:nord_cursor_line_number_background = 1
