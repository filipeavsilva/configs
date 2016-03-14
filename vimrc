"Useful stuff
set nocompatible                "No compatibility with old vi mode
set modelines=0                 "Avoid some kind of exploits... better let it be

"Misc options
set hls                         "Highlight search
set ic                          "Ignore case in search
set smartcase                   "Smart case in searches: lowercase: ignore, 1+ uppercase chars, case sensitive
set is                          "Incremental search
set showmatch                   "Show search match
set ffs=unix,mac,dos            "Allow all file formats
set undofile                    "Create undo file for each edited file
set gdefault                    "Substitutions default to global
set scrolloff=5                 "Scroll when cursor is 5 lines before the window edge
set sidescrolloff=3             "Scroll when cursor is 3 columns before the window edge
set ruler                       "always show the ruler
set showcmd                     "Show incomplete commands next to the ruler
set cursorline                  "Highlight the current line
set cursorcolumn                "Highlight the current column
set ts=4                        "Set tabstop to 4 (tabs have a length of 4 spaces)
set shiftwidth=4                "Set autoindent spaces to 2
set shiftround                  "use multiple of shiftwidth when indenting with '<' and '>'
set expandtab                   "Expand tabs to spaces
set encoding=utf-8              "Well, duh...
set autoread                    "Auto-load external changes to files
set cindent                     "C-style indents
set hidden                      "Hide buffers instead of closing them
set wildmenu                    "Command completion menu
set number                      "Turn line numbers on
set relativenumber              " ...and relative numbering
set t_Co=256                    "Pretty colors in terminal
set history=1000                "Remember a lot of commands
set display+=lastline           "Show as much of the last line as possible
set nrformats-=octal            "No octal here
set laststatus=2                "Show status line even with one window
set backspace=indent,eol,start  "Allow backspacing everywhere
set clipboard=unnamed           "Use the system's clipboard by default
let g:session_autoload = 'no'   "don't load sessions automatically...
let g:session_autosave = 'no'   " ...nor save them

syntax on
filetype on "Ensure filetype is on before turning off. Used to avoid returning an error, which prevents using vim as the git commit message editor
filetype off

"Set invisible character representation for using :set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
endif

"------------------------------------- Vundle Bundles
"Setting up Vundle (NOT WORKING in windows!
let iCanHazVundle=1
if has("win32") || has("win64") || has("win16")
    let vundle_readme=expand("$HOME/vimfiles/bundle/vundle/README.md")
else
    let vundle_readme=expand("$HOME/.vim/bundle/vundle/README.md")
endif
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    if has("win32") || has("win64") || has("win16")
        silent !mkdir -p $HOME/vimfiles/bundle
        silent !git clone https://github.com/gmarik/vundle $HOME/vimfiles/bundle/vundle
    else
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    endif
    let iCanHazVundle=0
endif

if has("win32") || has("win64")
    set rtp+=~/vimfiles/bundle/vundle/
    call vundle#rc()
else
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
endif


" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
"Deprecated version...
"Bundle 'powerline/powerline'
Bundle 'vim-airline/vim-airline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'chrismetcalf/vim-rainbow'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/csapprox'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'chriskempson/base16-vim'
if has("win32") || has("win64") || has("win16")
    Bundle 'noahfrederick/vim-noctu'
endif

"github/vim-scripts bundles
Bundle 'YankRing.vim'

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

"Fix some file detection nonsense
autocmd BufNewFile,BufRead *.md  setf markdown

"------------------------------------

let mapleader = ',' "Leader key is easier at , than \
let g:mapleader = ','

"Remove search highlights easily
nnoremap <leader><Space> :noh<Cr>

nnoremap <leader>r :NumbersToggle<CR>
"Toggle the numbers and retain the selection
vnoremap <leader>r :<C-U>NumbersToggle<CR>gv

"Set up and down keys to move by screen line and not file line
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

"Avoid pressing <Esc>
inoremap jk <Esc>

"Compensate for errors when running commands
command! W :w
command! Q :q

"Fix horrible, horrible regex literal char handling
nnoremap / /\v
vnoremap / /\v

"Keep text selected after indenting
vnoremap < <gv
vnoremap > >gv

"Keep : (commands) and ; (next result for f or t) in the same keys in portuguese
nnoremap Ç :
vnoremap Ç :
nnoremap ç ;
vnoremap ç ;

"Better way to work with splits
"nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
"TODO: Get these two to work!
let g:C_Ctrl_j = 'off'
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

"** TABS **

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

"Map Ctrl+Z, Ctrl+C and Ctrl+V back to undo, copy and paste, in windows
if has("win32") || has("win64") || has("win16")
    vnoremap <C-c> "+y
    "Keep the old <C-v> behavior in <M-v>
    noremap <M-v> <C-v>
    inoremap <M-v> <C-v>
    noremap <C-v> "+p
    inoremap <C-v> <C-r>+
    noremap <C-z> u
    inoremap <C-z> <C-o>u
endif

"Good tab labels
set guitablabel=%N\ %t\ %M
"Set spelling automatically for certain file types

set background=dark
colorscheme base16-bright

if has("gui")
    "Hide toolbar in GUI mode
    set guioptions=egrt
    set antialias "Smooth...

    if has("win32") || has("win64") || has("win16")
        set guifont=Powerline_Consolas:h9:cANSI
    else
        set guifont=Powerline\ Consolas:h12
    endif

    if has("mac") "Options for MacVim
        set transparency=7
    endif
else
    if has("win32") || has("win64") || has("win16") "Mac colors are OK
        set t_Co=16
        syntax on
        colorscheme noctu
    endif
endif


autocmd BufNewFile,BufRead *.txt setlocal spell

"Limit syntax highlighting to a few lines, to avoid slowing on files with long lines
set synmaxcol=200

"Refer to the directory of the current file in command mode
cabbr <expr> %% expand('%:p:h')

if has("win32") || has("win64") || has("win16") "Windows has the nasty habit of setting the pwd to C:\Windows\System32
    lcd $HOME
endif

"Change to a buffer's directory on entering
autocmd BufEnter * silent! lcd %:p:h

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

if !isdirectory($HOME . "/.vim/backup")
    if has("win64") || has("win32") || has("win16")
        silent !mkdir $HOME/.vim/backup
    else
        silent !mkdir -p $HOME/.vim/backup
    endif
endif

if !isdirectory($HOME . "/.vim/swap")
    if has("win64") || has("win32") || has("win16")
        silent !mkdir $HOME/.vim/swap
    else
        silent !mkdir -p $HOME/.vim/swap
    endif
endif

if !isdirectory($HOME . "/.vim/backup")
    if has("win64") || has("win32") || has("win16")
        silent !mkdir $HOME/.vim/undo
    else
        silent !mkdir -p $HOME/.vim/undo
    endif
endif

"****************** PLUGINS *****************
"Show/Hide Gundo undo graph
nnoremap <F5> :GundoToggle<CR>

"********************* NERDTree *******************
command! NT :NERDTreeTabsToggle

let g:nerdtree_tabs_open_on_gui_startup = 0 "Don't open unless I want to
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']
let NERDTreeAutoCenter          = 1 "auto center is on
let NERDTreeCaseSensitiveSort   = 1 "case sensitive sorting is on
let NERDTreeChDirMode           = 2 "set the CWD to the current root

"******** vim-powerline **********
let g:Powerline_symbols = 'fancy'
set laststatus=2 "Avoid statusline appearing only in splits

"Windows-specific stuff
if has("win32") || has("win64") || has("win16")
    set lines=41
    set columns=124
endif

