" -- Tab --
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set ignorecase
set smartcase

" -- base --
syntax on
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,sjis
set fileformats=unix,dos,mac
set ambiwidth=double
set clipboard& clipboard^=unnamedplus
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
set noswapfile
set nobackup
set backspace=indent,eol,start

" -- keymap --
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap <Esc><Esc> :noh<CR>

if has('mac')
  set clipboard& clipboard^=unnamed
endif
