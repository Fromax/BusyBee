""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~/.vimrc
" Ongoing work. Please don't use blindly!
" SOLARIZED setup: Install 'solarized.vim' in ~/.vim/colors. This should be enough for gvim.
" For vim on an xterm, make sure the Solarized colorscheme is chosen in the terminal prior to run. Many terminals
" have it built in nowadays. Else, install one. Read more on <https://github.com/altercation/vim-colors-solarized>
" I'm aiming to have this somehow working on 1) gvim, 2) vim xterm, 3) vim TTY.
" So far, only 1 and 2 work OK. 3 is only using a workaround.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set title
set number
syntax enable
set lazyredraw
set ttyfast
set t_Co=16

colorscheme solarized
set background=dark                     " change to 'background=light' for 'solarized light'. See keyboard mappings below:
:nnoremap § : set background=light<CR>  " (Shift-§) Optimised for DK keyboard. Choose any other key at will.
:nnoremap §§ : set background=dark<CR>  " (Shift-§§) Todo: Find a better solution for this "toggle"...

" Styling the "crosshair":
:hi cursorline   term=bold cterm=bold ctermbg=0
:hi cursorcolumn term=bold cterm=bold ctermbg=0
":hi cursorline term=reverse,bold cterm=reverse,bold

" Toggle CursorLine styling and toggle (Shift-H):
:nnoremap H :set cursorline!<CR>

" Toggle CursorColumn styling and toggle (Shift-Y):
:nnoremap Y :set cursorcolumn!<CR>

if has('gui_running')
  set guifont=Ubuntu\ Mono\ 10
  set guioptions-=T     " remove toolbar.
  set lines=45
  set columns=110
endif

set ruler
set wildmenu            " visual autocomplete for command menu
set autoindent
set smartindent
set helplang=en
set history=50
set modelines=0
set printoptions=paper:a4

filetype indent on      " load filetype-specific indent files

set termencoding=utf-8

set mouse=a             " Enable mouse in all modes

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd             " show command in bottom bar

