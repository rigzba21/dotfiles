" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


"Plugins
call plug#begin('~/.vim/plugged')

"status/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"syntax checking
Plug 'vim-syntastic/syntastic'

"dracula theme
Plug 'dracula/vim', { 'as': 'dracula' }

"Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"Rust
Plug 'rust-lang/rust.vim'

"YAML
Plug 'pedrohdz/vim-yaml-folds'
Plug 'Yggdroot/indentline'

"ALE
Plug 'dense-analysis/ale'

"Nerdtree
Plug 'preservim/nerdtree'

call plug#end()

set nocompatible
filetype off
"fix backspace in MacOS
set backspace=indent,eol,start

filetype plugin indent on

" my default tab settings
syntax enable
set tabstop=4 "spaces per TAB char
set softtabstop=4 "editor spacing for TAB
set shiftwidth=4
set expandtab "sets tabs into spaces (i.e. for Python)


"split configuration
set splitbelow
set splitright

" Linux Kernel Development recommended settings
"syntax on
"set title
"set tabstop=8
"set softtabstop=8
"set shiftwidth=8
"set noexpandtab 

set autoindent
set smartindent
set number "line #s
set showcmd "cmd display at bottem
set cursorline "line display
set showmatch "highlight matching brackets
set hlsearch "highlight search matches
set hidden
set mouse=r "use mode r, allows for copy/paste mouse interactions
set noshowmode
set noshowmatch
set nolazyredraw
set pastetoggle=<F3> "F3 to turn toggle  autoindent when pasting code

"turn off backup
set nobackup
"turn off swp file
set noswapfile
"turn off writebackup
set nowritebackup
"search config
set ignorecase "ignore case for search
set smartcase

"colorscheme
colorscheme dracula

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" set NERDTree to show hidden files
let NERDTreeShowHidden=1

"ALE
let g:ale_lint_on_enter = 0
let g:ale_line_on_text_changed = 'never'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

"YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
set foldlevelstart=20
let g:indentLine_char = '⦙'


"Airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = '✘'
let g:airline#ensentions#ale#warning_symbol = '⚠'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:systastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = -1

"any additional config...
