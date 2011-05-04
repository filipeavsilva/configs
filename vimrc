"Misc options
set hls "Highlight search
set ic "Ignore case in search
set smartcase "Smart case in searches: lowercase: ignore, 1+ uppercase chars, case sensitive
set is "Incremental search
set showmatch "Show search match

"Load Pathogen bundle manager
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

"Useful stuffs
set nocompatible "No compatibility with old vi mode
set modelines=0 "Avoid some kind of exploits... better let it be
"Remove search highlights easily
nnoremap <leader><space> :noh<cr> 

"Set tabs to match blocks
nnoremap <tab> % 
vnoremap <tab> %

"Set up and down keys to move by screen line and not file line
nnoremap j gj 
nnoremap k gk

"Compensate for errors when running commands
nnoremap ; :

"Colors
syntax enable
set background=dark
colorscheme solarized

"Better way to work with splits
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Show line numbers
set number

"Hide toolbar in GUI mode
if has("gui_running")
    set guioptions=egmrt
endif

