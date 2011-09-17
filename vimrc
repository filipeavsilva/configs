"Misc options
set hls "Highlight search
set ic "Ignore case in search
set smartcase "Smart case in searches: lowercase: ignore, 1+ uppercase chars, case sensitive
set is "Incremental search
set showmatch "Show search match
set ffs=mac,unix,dos "Allow all file formats
set undofile "Create undo file for each edited file
set gdefault

"Load Pathogen bundle manager
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

"Useful stuff
set nocompatible "No compatibility with old vi mode
set modelines=0 "Avoid some kind of exploits... better let it be

"Remove search highlights easily
nnoremap <leader><space> :noh<cr> 

"Easy block matching
nnoremap <tab> %
vnoremap <tab> %

"Set tabs to match blocks
nnoremap <tab> % 
vnoremap <tab> %

"Set up and down keys to move by screen line and not file line
nnoremap j gj 
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

"Compensate for errors when running commands
nnoremap ; :
command W :w
command Q :q

let mapleader = ',' "Leader key is easier at , than \

"Fix horrible, horrible regex literal char handling
nnoremap / /\v
vnoremap / /\v

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

"'Normal' tab control bindings
"Normal, visual, select and operator-pending modes
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
vnoremap <C-Tab> gt
vnoremap <C-S-Tab> gT
onoremap <C-Tab> gt
onoremap <C-S-Tab> gT
"Insert mode
inoremap <C-Tab> <C-o>gt
inoremap <C-S-Tab> <C-o>gT

"****************** PLUGINS *****************
"Show/Hide NERDTree
command NT NERDTreeToggle

"Show/Hide Gundo undo graph
nnoremap <F5> :GundoToggle<CR>
