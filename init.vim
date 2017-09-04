"==================
" PLUGINS
" ================

call plug#begin('~/.local/share/nvim/plugged')

" Themes
Plug 'dracula/vim'

" Nerdtree
Plug 'scrooloose/nerdtree'
" Nerdtree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Closes buffer without closing window
Plug 'moll/vim-bbye'

" Tmux navigator
Plug 'chrtoomey/vim-tmux-navigator'

" Javascript Syntax

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Auto Pairs (match pairs, delimimate alt)
Plug 'jiangmiao/auto-pairs'

" YouCompleteMe (with post install hook to compile for JS)
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

" Neomake, asynchronous programs
Plug 'neomake/neomake'

"Editor config
Plug 'editorconfig/editorconfig-vim'

" CSS Colors
Plug 'ap/vim-css-color'

" Highlight on yank
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'

" Vim file icons
Plug 'ryanoasis/vim-devicons'

" Commentary
Plug 'tpope/vim-commentary'

" Fugitive
Plug 'tpope/vim-fugitive'

" Surround
Plug 'tpope/vim-surround'

" Adds more text objects such as next and previous 
Plug 'wellle/targets.vim'

" Dracula theme 
Plug 'dracula/vim'

" Adds more text objects such as next and previous 
Plug 'tpope/vim-repeat'

" Auto-Indentation python
Plug 'vim-scripts/indentpython.vim'

" VIM syntax checking
Plug 'scrooloose/syntastic'

" PEP8 Checking
Plug 'nvie/vim-flake8'

" fzf - fast searching
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" Tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" Replace with Register
Plug 'ReplaceWithRegister'

" Hard Mode  
" Plug 'wikitopian/hardmode'

" Motions specific to JS
Plug 'okcompute/vim-javascript-motions'

call plug#end()

"==================
" VIM CONFIG
" ================
"
" Syntax Highlighting

syntax enable
" Line Numbers

set number
" set relativenumber

" JSX when in JS mode
let g:jsx_ext_required = 0

" Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Fix Delete Key (OSX)
set backspace=indent,eol,start

" Resize splits when the window  resized
au VimResized * exe "normal! \<c-w>="

" Split the right way
set splitbelow
set splitright

" Backup settings
set nobackup
set noswapfile
set nowb

" Default to using System Clipboard
set clipboard^=unnamed,unnamedplus

" No sounds
set visualbell
set noerrorbells

" File Formatting
set nowrap
set autoindent
set copyindent

" Searching
set smartcase
set smarttab
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class

" Sets the title of the window to the filename
set title

" Enable creation and deletion of files in nerdtree (modifiable)
set modifiable

" Highlights the entire cursor line 
set cursorline

" Link python executable
" https://github.com/neovim/neovim/sues/4535
" let g:python2_host_prog = '/usr/bin/python'
let g:python3_host_prog = 'Users/lenny.boyatzis/miniconda3/envs/python3/bin/python3.5'

" Python Indentation - PEP 8 Stylin

 au BufNewFile,BufRead *.py set tabstop=4|set softtabstop=4|set shiftwidth=4|set textwidth=79|set expandtab|set autoindent|set fileformat=unix

set encoding=utf-8

let python_highlight_all=1
let g:pymode_python = 'python3'

"==========================
" SYNTASTIC - ESLINT CONFIG
" ========================

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'

"==================
" HARD MODE CONFIG
"==================

" Enable hard mode by default
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Disable hard mode on first key press for special buffer (like nerdTree)
" autocmd VimEnter,BufNewFile,BufReadPost * if !strlen(&buftype) | silent! call HardMode() | endif

"==================
" ESLINT CONFIG
" ================

" Eslint config
let g:syntastic_javascript_checkers = ['eslint']

"==================
" KEY BINDINGS
" ================

" Set a Leader Key
let mapleader = "\<Space>"

" Blank lines without insert mode
nnoremap <leader>o o<Esc>
nnoremap <leader>o o<Esc>

" Delete to 'black hole' regter
nnoremap x "_x

" Buffer
nnoremap <Leader>q :Bdelete<CR>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" Toggle Hard Mode
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" Resolve issue with <C-h>
" see https://github.com/neovim/neovim/issues/2048
if has('nvim')
nmap <BS> <C-W>h
endif

"==================
" THEME
" ================

set termguicolors
if has("termguicolors")
 set termguicolors
endif

colorscheme dracula
set background=dark

"==================
" Nerdtree
" ================

noremap <leader>f :NERDTreeToggle<CR>

" Close vim if the only window left open  nerdtree
autocmd bufenter * if (winnr("$") == 1 && ("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" prevent buffer next, previous and delete when focused on Nerdtree
autocmd FileType nerdtree nnoremap <buffer> <Tab> <nop>
autocmd FileType nerdtree nnoremap <buffer> <S-Tab> <nop>
autocmd FileType nerdtree nnoremap <buffer> <C-q> :NERDTreeToggle<CR>
autocmd FileType nerdtree nnoremap <buffer> <C-p> <nop>
autocmd FileType nerdtree nnoremap <buffer> <Leader>p <nop>

let NERDTreeIgnore = ['\.pyc$']

"==================
" Pymode
" ================
" let g:pymode = 1

" let g:pymode_python = 'python3'

" " Enable Pymode Motion - can move Functions, Classes and Methods
" let g:pymode_motion = 1

" " Enable breakpoint detection
" let g:pymode_breakpoint = 1

" " Run python code
" let g:pymode_run_bind = '<leader>r'

"==================
" Airline
" ================

" Always show airline

set laststatus=2

" Enable the lt of buffers
let g:airline#extensions#tabline#enabled = 1

" Load powerline fonts
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" --------------
" Neomake
" --------------
autocmd! BufWritePost,BufEnter * Neomake

" use neomake for eslint
let g:neomake_javascript_enabled_makers = ['eslint']
