execute pathogen#infect('bundle/{}', '~/.vimbundle/{}')

let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_lazy_update = 250
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0
if executable("ag")
  let g:ctrlp_user_command = 'ag %s -l --nocolor
        \ --ignore .git
        \ --ignore .svn
        \ --ignore "out/*"
        \ --ignore "out_**/*"
        \ -g ""'
endif

set nocompatible
set nomodeline

set background=dark
let g:solarized_termcolors=256
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
  source ~/src/chrome/src/tools/vim/ninja-build.vim
endif

if has("autocmd")
  filetype off
  filetype plugin indent on
endif
