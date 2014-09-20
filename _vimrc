set nocompatible
set nomodeline

set background=dark
colorscheme solarized
syntax on

set laststatus=2
set number
set ruler

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

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set scrolloff=1
set sidescrolloff=5
set display+=lastline

if !exists('g:loaded_matchit')
  runtime! macros/matchit.vim
endif

if hostname() =~ "\\.corp\\.google\\.com$" && filereadable("/usr/share/vim/google/google.vim")
  source /usr/share/vim/google/google.vim
endif

if has("autocmd")
  filetype off
  filetype plugin indent on
endif
