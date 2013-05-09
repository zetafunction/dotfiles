set nocompatible
set nomodeline

syntax on
set background=dark
colorscheme solarized

set laststatus=2
set number
set ruler

if has("autocmd")
  filetype plugin indent on
endif

set expandtab
set shiftwidth=2
set softtabstop=2

set backspace=indent,eol,start

set showmatch

set hlsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif
set incsearch

set scrolloff=1
set sidescrolloff=5
set display+=lastline

if !exists('g:loaded_matchit')
  runtime! macros/matchit.vim
endif
