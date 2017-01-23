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
set smarttab

filetype plugin indent on

" Show mode 
set showmode
"show (characters|lines) in visual mode
set showcmd

" relative line numbers
set relativenumber
set number

" Text editing line wrapping
set textwidth=160

" give three lines of context when moving the cursor around
set scrolloff=3

set backspace=indent,eol,start

" Do some folding. No markers, but persists across saves and loads. Does not persist between machines.
set foldmethod=manual
set viewoptions-=options
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview 

" Search options
set incsearch
set hlsearch

" highlight matching parens for a short time
set showmatch
set matchtime=2

set report=0

" Splits appear on the right side
set splitbelow
set splitright

" tab completion in ex mode
set wildmenu
set wildignore+=.log,.out,.o
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set completeopt+=longest

" tab completion with ctrl + tab
" imap <C-Z> <C-P>

" Binds
" New Leader
let mapleader= ","

" Make removing highlights really fast
nnoremap <leader>h :nohl<CR>

" automatically make enclosing curly brackets.
inoremap {<Return> {<Return>}<Left><Return><Up><Tab>

" Vim memory
" remember lotsa fun stuff
set viminfo=!,'1000,f1,/1000,:1000,<1000,@1000,h,n~/.viminfo

" persistent undo
if exists("+undofile")
	set undofile
	set undodir=/var/tmp/vim-nebel/undo
endif

" swap files
set backupdir=/var/tmp/vim-nebel/swap
set directory=/var/tmp/vim-nebel/swap

" Make vim less whiny
" no bells whatsoever
set vb t_vb=

" if you :q with changes it asks you if you want to continue or not
set confirm

" 50 milliseconds for escape timeout instead of 1000
set ttimeoutlen=50

" send more data to the terminal in a way that makes the screen update faster
set ttyfast

" Indentation
" < > will hit indentation levels instead of always +-2
set shiftround

" keep visual after indenting
vnoremap < <gv
vnoremap > >gv

nnoremap < <<
nnoremap > >>

" word completion menu
highlight Pmenu      ctermfg=grey  ctermbg=darkblue
highlight PmenuSel   ctermfg=red   ctermbg=darkblue
highlight PmenuSbar  ctermbg=cyan
highlight PmenuThumb ctermfg=red

highlight WildMenu ctermfg=grey ctermbg=darkblue

" Syntastic
map <Leader>s :SyntasticToggleMode<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" C++ is really C++14
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = '-std=c++14'

" nerdcommenter

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"defaultbindings"{{{

"[count]<leader>cc |NERDComComment|
"Comment out the current line or text selected in visual mode.

"[count]<leader>cn |NERDComNestedComment|
"Same as cc but forces nesting.

"[count]<leader>c<space> |NERDComToggleComment|
"Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.

"[count]<leader>cm |NERDComMinimalComment|
"Comments the given lines using only one set of multipart delimiters.

"[count]<leader>ci |NERDComInvertComment|
"Toggles the comment state of the selected line(s) individually.

"[count]<leader>cs |NERDComSexyComment|
"Comments out the selected lines with a pretty block formatted layout.

"[count]<leader>cy |NERDComYankComment|
"Same as cc except that the commented line(s) are yanked first.

"<leader>c$ |NERDComEOLComment|
"Comments the current line from the cursor to the end of line.

"<leader>cA |NERDComAppendComment|
"Adds comment delimiters to the end of line and goes into insert mode between them.
"}}}

" Tabularize
" Tab arrows
nnoremap ta :Tabularize /-><CR>
vnoremap ta :Tabularize /-><CR>

" Tab fat arrows
nnoremap tf :Tabularize /=><CR>
vnoremap tf :Tabularize /=><CR>

" Colors
" 256 color mode
" set t_Co=256
set termguicolors
" colorscheme sift
" colorscheme desert256
colorscheme eldar

" Highlight current line
hi CursorLine term=bold cterm=bold guibg=none
set cursorline

" Airline options
" let g:airline_theme='desert256'
set laststatus=2

"Pathogen 
execute pathogen#infect()
