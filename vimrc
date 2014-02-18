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
set nu                          "Turn line numbers on
set t_Co=256                    "Pretty colors in terminal
set history=1000                "Remember a lot of commands
set display+=lastline           "Show as much of the last line as possible
set nrformats-=octal            "No octal here
set laststatus=2                "Show status line even with one window
let g:session_autoload = 'no'   "don't load sessions automatically...
let g:session_autosave = 'yes'  " ...but save them

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
if has("win32") || has("win64")
    let vundle_readme=expand("$HOME/vimfiles/bundle/vundle/README.md")
else
    let vundle_readme=expand("$HOME/.vim/bundle/vundle/README.md")
endif
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    if has("win32") || has("win64")
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

"github+Vundle powah!!!
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-abolish'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'skammer/vim-css-color'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'groenewege/vim-less'
"Dependency for vim-session
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'

Bundle 'scrooloose/syntastic'
Bundle 'davidoc/taskpaper.vim'
"Deprecated version...
Bundle 'Lokaltog/vim-powerline'
"Upcoming, beta version. Uncomment when ready
"Bundle 'Lokaltog/powerline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'chrismetcalf/vim-rainbow'
"Not quite working correctly...
Bundle 'tpope/vim-repeat'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'tpope/vim-surround'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mattn/zencoding-vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nelstrom/vim-markdown-preview'
Bundle 'myusuf3/numbers.vim'
Bundle 'godlygeek/csapprox'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'nono/vim-handlebars'
"Color scheme for 16-color terminal
Bundle 'noahfrederick/vim-noctu'
Bundle 'kien/ctrlp.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'marijnh/tern_for_vim'
Bundle 'mrtazz/simplenote.vim'

"github/vim-scripts bundles
"Bundle 'YankRing.vim' "IS BUGGY?
Bundle 'tlib'
Bundle 'Tagbar'
Bundle 'matchit.zip'

"Other git repos
Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

"Fix some file detection nonsense
autocmd BufNewFile,BufRead *.coffee set filetype=coffee

"------------------------------------

let mapleader = ',' "Leader key is easier at , than \
let g:mapleader = ','

"Remove search highlights easily
nnoremap <leader><Space> :noh<Cr>

nnoremap <leader>r :NumbersToggle<CR>
"Toggle the numbers and retain the selection
vnoremap <leader>r :<C-U>NumbersToggle<CR>gv

"Toggle fullscreen
fu! ToggleFU()
    if &fullscreen
        set nofu
        set guioptions+=r "add scrollbar
    else
        set fu
        set guioptions-=r "remove scrollbar
    endif
endfunction

nnoremap <M-Return> :call ToggleFU()<CR>
vnoremap <M-Return> :call ToggleFU()<CR>

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


"Colors
set background=dark

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

"Good tab labels
set guitablabel=%N\ %t\ %M
"Set spelling automatically for certain file types

if has("gui")
    colorscheme solarized

    "Hide toolbar in GUI mode
    set guioptions=egmrt
    set guifont=Consolas_for_Powerline_FixedD:h9:cANSI

    if has("mac") "Options for MacVim
        "Don't stretch window horizontally in fullscreen mode
        "Set the backgroud color in fullscreen
        set fuoptions=maxvert,background:#FF002b36 "TODO: Set this dynamically to the bg color of the color scheme
    endif
else
    if has("win32") || has("win64") "Mac colors are OK
        colorscheme noctu
    endif
endif


autocmd FileType tex setlocal spell "latex
autocmd BufNewFile,BufRead *.txt setlocal spell

"Limit syntax highlighting to a few lines, to avoid slowing on files with long lines
set synmaxcol=200

"Refer to the directory of the current file in command mode
cabbr <expr> %% expand('%:p:h')

if has("win32") || has("win64") "Windows has the nasty habit of setting the pwd to C:\Windows\System32
    lcd $HOME
endif

"Change to a buffer's directory on entering
autocmd BufEnter * silent! lcd %:p:h

"****************** Quickfix window *************************************
function! QFixToggle()
    if exists("g:qfix_win")
        cclose
        unlet g:qfix_win
    else
        botright copen
        let g:qfix_win = bufnr("$")
    endif
endfunction

map <leader>. :call QFixToggle()<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>

"Save and load folds when leaving/entering
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

"****************** PLUGINS *****************
"Show/Hide Gundo undo graph
nnoremap <F5> :GundoToggle<CR>

"Change Yankring history file location
"if has("win32")
"let g:yankring_history_file = 'vimfiles/.yankring_history'
"else
"let g:yankring_history_file = '.vim/.yankring_history'
"endif

"********************* Simplenote *******************
if filereadable("~/.simplenote")
    so ~/.simplenote
endif

"********************* NERDTree *******************
command! NT :NERDTreeTabsToggle

let g:nerdtree_tabs_open_on_gui_startup = 0 "Don't open unless I want to
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']

"******** vim-powerline **********
let g:Powerline_symbols = 'fancy'
set laststatus=2 "Avoid statusline appearing only in splits

"Windows-specific stuff
if has("win32")
    set bs=2
    set lines=41
    set columns=124
endif

"LaTeX stuff
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_GotoError=0 "Don't go to errors

"Set LaTeX viewer
if has("unix") && match(system("uname"),'Darwin') != -1
    " It's a Mac!
    let g:Tex_ViewRule_pdf = 'open -a Preview.app'
endif
"Backup file cleaning

if has("win32") || has("win64")
    silent execute '!mkdir '.$HOME.'\vimfiles\backupfiles'
    silent execute '!mkdir '.$HOME.'\vimfiles\swapfiles'
    set backupdir=$HOME/vimfiles/backupfiles//
    set directory=$HOME/vimfiles/swapfiles//
    if exists("+undofile")
        silent execute '!mkdir '.$HOME.'\vimfiles\undofiles'
        set undodir=$HOME/vimfiles/undofiles//
    endif
else "mac, unix
    set backupdir=~/.vim/backupfiles//
    set directory=~/.vim/swapfiles//
    if exists("+undofile")
        set undodir=~/.vim/undofiles//
    endif
endif

"Abbreviations (using Abolish.vim)
if exists('g:loaded_abolish')
    Abolish functino function
endif
