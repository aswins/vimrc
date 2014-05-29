set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set hidden

"set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set scrolloff=8   " 8 lines at least

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
"set visualbell           " don't beep
set noerrorbells         " don't beep
set wildmenu			" Better command line completion
set wildmode=list:longest,full

filetype plugin indent on
autocmd filetype python set expandtab
set expandtab


" if &t_Co >= 256 || has("gui_running")
"    colorscheme mustang
" endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

"open tag in vertical split
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

map <C-b> :CtrlPBuffer<CR>

set pastetoggle=<F2>
nnoremap <silent> <F6> :TlistToggle<CR> 	" For tag list
" let Tlist_Use_Right_Window = 1 
"set mouse=a

nnoremap ; :
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Remove highlight on ./
nmap <silent> ,/ :nohlsearch<CR>

cmap w!! w !sudo tee % >/dev/null 

compiler gcc


" Correct typos
:command WQ wq
:command Wq wq
:command W w
:command Q q

:command Plist YRShow   

noremap <silent> <F3>  :NERDTreeToggle <CR>

set cul                                           " highlight current line
" hi CursorLine term=none cterm=none ctermbg=0      " adjust color

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         

set term=xterm-256color
set laststatus=2
let g:Powerline_symbols = 'fancy'

" let &titleold=getcwd()

set grepprg=git\ grep\ -n\ -i
set guifont=Source\ Code\ Pro\ for\ Powerline\ 14
command Todo noautocmd vimgrep /TODO\|FIXME/j ** | cw
