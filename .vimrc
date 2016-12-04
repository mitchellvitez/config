set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'shemerey/vim-peepopen'
Plugin 'ngmy/vim-rubocop'
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/fzf'
Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'OmniSharp/Omnisharp-vim'
Plugin 'alvan/vim-closetag'
Plugin 'eagletmt/neco-ghc'
Plugin 'ElmCast/elm-vim'

call vundle#end()

filetype plugin indent on
syntax on
" colorscheme vital

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
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
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

ca ag Ag!
ca Ag Ag!

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

let g:gitgutter_sign_column_always = 1
let g:gitgutter_realtime = 1
let g:gitgutter_sign_added = '+'

set updatetime=250

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
nnoremap <Leader>l :SyntasticCheck<CR>
nnoremap <Leader>lr :SyntasticReset<CR>
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = 'XX'
let g:syntastic_python_python_exec = '/usr/local/bin/python3'

let g:ycm_semantic_triggers = {'haskell' : ['.']}

nnoremap <Leader>g :GitGutterToggle<CR>

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

nnoremap <leader>c :call NERDComment(0,"toggle")<C-m>

let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}

command W w
command Q q

nnoremap ; :

map <leader>f :FZF<C-m>
map <leader>a :Ag 

" Pressing F10 shows the current syntax group to know which highlight colors to change
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),2),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Ruby syntax highlighting
highlight rubyString ctermfg=Green
highlight rubyInterpolationDelimiter ctermfg=29
highlight rubyInterpolation ctermfg=LightGreen
highlight rubyConstant ctermfg=Red

