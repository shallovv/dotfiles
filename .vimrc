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
set noswapfile
set nobackup
set backspace=indent,eol,start

" -- keymap --
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap <Esc><Esc> :noh<CR>

" -- vim-plug --
call plug#begin('$HOME/.vim/plugged')
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'itchyny/lightline.vim'
call plug#end()

" -- vim-lsp --
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> <f2> <plug>(lsp-rename)
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_text_edit_enabled = 1

" -- asyncomplete.vim --
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
