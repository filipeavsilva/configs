"Misc options
set hls "Highlight search
set ic "Ignore case in search
set smartcase "Smart case in searches: lowercase: ignore, 1+ uppercase chars, case sensitive
set is "Incremental search
set showmatch "Show search match
set ffs=mac,unix,dos "Allow all file formats
set undofile "Create undo file for each edited file
set gdefault
set so=7 "Scroll when cursor is 7 lines before the window edge
set ruler "always show the ruler
set showcmd "Show incomplete commands next to the ruler
set cursorline "Highlight the current line

"Load Pathogen bundle manager
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

"Useful stuff
set nocompatible "No compatibility with old vi mode
set modelines=0 "Avoid some kind of exploits... better let it be

let mapleader = ',' "Leader key is easier at , than \
let g:mapleader = ',' 

"Remove search highlights easily
nnoremap <leader><Space> :noh<Cr> 

"Toggle relative line numbers easily (since they're unset automatically
"sometimes)
fu! ToggleRNU()
				if &rnu
								set number	"Set normal line numbers
				else
								set rnu			"Set relative line numbers
				endif
endfunction

nnoremap <leader>r :call ToggleRNU()<CR>
vnoremap <leader>r :call ToggleRNU()<CR>
inoremap <leader>r :call ToggleRNU()<CR>

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
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Show line numbers
"set number

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

"****************** Cope *************************************
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>

"****************** PLUGINS *****************
"Show/Hide NERDTree
command NT NERDTreeToggle

"Show/Hide Gundo undo graph
nnoremap <F5> :GundoToggle<CR>

"************* VIMWIKI SETTINGS *************
"Thesis wiki options
"(for mac only)
if has("win32") == 0
	let thesiswiki = {}
	let thesiswiki.maxhi = 1
	let thesiswiki.css_name = 'style.css'
	let thesiswiki.auto_export = 1
	let thesiswiki.diary_index = 'diary'
	let thesiswiki.nested_syntaxes = {}
	let thesiswiki.path = '/Users/filipesilva/IST/LEIC/5º Ano (2º MEIC)/Tese/Wiki/'
	let thesiswiki.diary_link_fmt = '%Y-%m-%d'
	let thesiswiki.template_path = '/Users/filipesilva/IST/LEIC/5º Ano (2º MEIC)/Tese/Wiki/templates'
	let thesiswiki.template_default = 'navigation_links.html'
	let thesiswiki.template_ext = '.html'
	let thesiswiki.diary_link_count = 4
	let thesiswiki.syntax = 'default'
	let thesiswiki.index = 'index'
	let thesiswiki.diary_header = 'Diary'
	let thesiswiki.ext = '.wiki'
	let thesiswiki.path_html = '/Users/filipesilva/IST/LEIC/5º Ano (2º MEIC)/Tese/Wiki/html'
	let g:vimwiki_list = [thesiswiki]
endif

"Relative line numbering
set rnu

set ts=2 "Set tabstop to 2 (tabs have a length of 2 spaces)
set encoding=utf-8
set autoread

"Windows-specific stuff
"set base directory in windows (mac already has this set correctly)
if has("win32")
	cd ~
	set bs=2
	set gfn=Courier_New:h9:cANSI
	"au GUIEnter * simalt ~x "maximize window
	set lines=41
	set columns=124		
	winpos 6 29
endif
