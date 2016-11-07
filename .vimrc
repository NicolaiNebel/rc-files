"Pathogen 
execute pathogen#infect()

" Encode everything as unicode.
set encoding=utf8

" yay tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

syntax on
set autoindent
set smartindent

filetype plugin indent on

" Show mode 
set showmode
"show (characters|lines) in visual mode
set showcmd

" relative line numbers
set relativenumber
set number

" give three lines of context when moving the cursor around
set scrolloff=3

" Highlight matches of search
set hlsearch

" highlight matching parens for a short time
set showmatch
set matchtime=2

set report=0

" Splits appear on the right side
set splitbelow
set splitright

set backspace=indent,eol,start

" tab completion in ex mode
set wildmenu
set wildignore+=.log,.out,.o

" tab completion with ctrl + tab
imap <C-Z> <C-P>

" automatically make enclosing curly brackets.
inoremap {<Return> {<Return>}<Left><Return><Up><Tab>

" remember lotsa fun stuff
set viminfo=!,'1000,f1,/1000,:1000,<1000,@1000,h,n~/.viminfo

" persistent undo
if exists("+undofile")
	set undofile
	set undodir=/var/tmp/vim-nebel/undo
endif

" Make vim less whiny {{{
" :bn with a change in the current buffer? no prob!
set hidden

" no bells whatsoever
set vb t_vb=

" if you :q with changes it asks you if you want to continue or not
set confirm

" 50 milliseconds for escape timeout instead of 1000
set ttimeoutlen=50

" send more data to the terminal in a way that makes the screen update faster
set ttyfast
"}}}


" < > will hit indentation levels instead of always +-3
set shiftround

" keep visual after indenting
vnoremap < <gv
vnoremap > >gv

" swap files
set backupdir=/var/tmp/vim-nebel/swap
set directory=/var/tmp/vim-nebel/swap

" Colors
" 256 color mode
set t_Co=256

" colorscheme sift
colorscheme desert256

" word completion menu {{{
highlight Pmenu      ctermfg=grey  ctermbg=darkblue
highlight PmenuSel   ctermfg=red   ctermbg=darkblue
highlight PmenuSbar  ctermbg=cyan
highlight PmenuThumb ctermfg=red

highlight WildMenu ctermfg=grey ctermbg=darkblue
