"Useful stuff
set nocompatible "No compatibility with old vi mode
set modelines=0 "Avoid some kind of exploits... better let it be

"Misc options
set hls "Highlight search
set ic "Ignore case in search
set smartcase "Smart case in searches: lowercase: ignore, 1+ uppercase chars, case sensitive
set is "Incremental search
set showmatch "Show search match
set ffs=unix,mac,dos "Allow all file formats
set undofile "Create undo file for each edited file
set gdefault
set so=7 "Scroll when cursor is 7 lines before the window edge
set ruler "always show the ruler
set showcmd "Show incomplete commands next to the ruler
set cursorline "Highlight the current line
set cursorcolumn "Highlight the current column
set rnu "Relative line numbering 
set ts=2						"Set tabstop to 2 (tabs have a length of 2 spaces)
set shiftwidth=2 		"Set autoindent spaces to 2
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set encoding=utf-8
set autoread				"Auto-load external changes to files
set cindent
set hidden	"Hide buffers instead of closing them
set wildmenu "Command completion menu
let g:session_autoload = 'no' "don't load sessions automatically...
let g:session_autosave = 'yes' " ...but save them

if has("mac") && has("gui") "Options for MacVim
	"Don't stretch window horizontally in fullscreen mode
	"Set the backgroud color in fullscreen
	set fuoptions=maxvert,background:#FF002b36 "TODO: Set this dynamically to the bg color of the color scheme
endif

filetype on "Ensure filetype is on before turning off. Used to avoid returning an error, which prevents using vim as the git commit message editor
filetype off

"------------------------------------- Vundle Bundles
" Setting up Vundle
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
		echo "Installing Vundle.."
		echo ""
		silent !mkdir -p ~/.vim/bundle
		silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
		let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

"github+Vundle powah!!!
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-abolish'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'wincent/Command-T'
Bundle 'skammer/vim-css-color'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'xolox/vim-session'
Bundle 'tsaleh/vim-supertab'
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
"Not wuite working correctly...
"Bundle 'tpope/vim-repeat'
Bundle 'garbas/vim-snipmate'
Bundle 'tpope/vim-surround'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mattn/zencoding-vim'

"github/vim-scripts bundles
Bundle 'YankRing.vim'

if iCanHazVundle == 0
	echo "Installing Bundles, please ignore key map error messages"
	echo ""
	:BundleInstall
endif

filetype plugin indent on

"------------------------------------

let mapleader = ',' "Leader key is easier at , than \
let g:mapleader = ',' 

"Remove search highlights easily
nnoremap <leader><Space> :noh<Cr> 

"Toggle relative line numbers easily (you may want to see the actual line
"numbers, and the relative ones are unset automatically sometimes)
fu! ToggleRNU()
	if &rnu
		set number	"Set normal line numbers
	else
		set rnu			"Set relative line numbers
	endif
endfunction

nnoremap <leader>r :call ToggleRNU()<CR>
vnoremap <leader>r :call ToggleRNU()<CR>

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

"Compensate for errors when running commands
nnoremap ; :
command W :w
command Q :q
command X :x

"Fix horrible, horrible regex literal char handling
nnoremap / /\v
vnoremap / /\v

"Colors
syntax enable
set background=dark
colorscheme solarized

"Better way to work with splits
"nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
"TODO: Get these two to work!
let g:C_Ctrl_j = 'off'
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

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

"Set spelling automatically for certain file types
autocmd FileType tex setlocal spell "latex
autocmd BufNewFile,BufRead *.txt setlocal spell

"Limit syntax highlighting to a few lines, to avoid slowing on files with long lines
set synmaxcol=200

"Refer to the directory of the current file in command mode
cabbr <expr> %% expand('%:p:h')

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
if has("win32")
	let g:yankring_history_file = 'vimfiles/.yankring_history'
else
	let g:yankring_history_file = '.vim/.yankring_history'
endif

"********************* NERDTree *******************
command NT :NERDTreeToggle

"Quit NERDTree if it's the last window
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

"******** vim-powerline **********
let g:Powerline_symbols = 'fancy'
set laststatus=2 "Avoid statusline appearing only in splits

"Windows-specific stuff
"set base directory in windows (mac already has this set correctly)
if has("win32")
	"cd ~
	set bs=2
	set gfn=Courier_New:h9:cANSI
	set lines=41
	set columns=124		
	winpos 6 29
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

if has("win32")
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

"Load Timeline stuff
"if has("win32")
	"so $HOME/vimfiles/bundle/timeline/timeline.vim
"else
	"so $HOME/.vim/bundle/timeline/timeline.vim
"endif
""Timeline mappings
"nnoremap <leader>m :call TimelineEntry()<cr>

"Abbreviations (using Abolish.vim)
if exists('g:loaded_abolish')
	Abolish functino function
endif
