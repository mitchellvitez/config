set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'shemerey/vim-peepopen'
Plugin 'ngmy/vim-rubocop'
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/fzf'
Plugin 'vim-airline/vim-airline'

call vundle#end()

filetype plugin indent on
syntax on

set encoding=utf-8
set ttyfast
set mouse=a
set ttymouse=xterm2
set number
set clipboard=unnamed
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set title
set titleold=""
set titlestring=\ %f
set ignorecase
set smartcase
set t_ts=]1;
set t_fs=
set hidden
set autoindent
set incsearch
set backspace=indent,eol,start
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set background=dark

let g:airline_left_sep=''
let g:airline_right_sep=''

autocmd BufNewFile,BufRead *.cjsx set syntax=javascript
autocmd BufNewFile,BufRead *.coffee set syntax=javascript

set runtimepath^=~/.vim/bundle/ag

let mapleader=','

inoremap jk <Esc>
inoremap kj <Esc>

set wildmode=longest,list,full
set wildmenu

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

highlight LineNr ctermfg=darkgrey
highlight LineNr guibg=darkgrey

ca ag Ag!
ca Ag Ag!

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

nnoremap <leader>c :call NERDComment(0,"toggle")<C-m>

command W w
command Q q

nnoremap ; :

map <leader>f :FZF<C-m>
map <leader>a :Ag 
