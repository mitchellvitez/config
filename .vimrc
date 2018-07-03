filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'shemerey/vim-peepopen'
Plugin 'ngmy/vim-rubocop'
Plugin 'tpope/vim-commentary'
Plugin 'junegunn/fzf'
Plugin 'vim-airline/vim-airline'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/neocomplete'
Plugin 'jiangmiao/auto-pairs'
Plugin 'airblade/vim-gitgutter'
" Plugin 'scrooloose/syntastic'
" Plugin 'neomake/neomake'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
" Plugin 'OmniSharp/Omnisharp-vim'
" Plugin 'vim-scripts/OmniCppComplete'
Plugin 'alvan/vim-closetag'
Plugin 'eagletmt/neco-ghc'
Plugin 'ElmCast/elm-vim'
Plugin 'pbrisbin/vim-syntax-shakespeare'
Plugin 'KabbAmine/vCoolor.vim'	
" Plugin 'chrisbra/Colorizer'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/tpope-vim-abolish'
Plugin 'osyo-manga/vim-over'
Plugin 'munshkr/vim-tidal'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'ervandew/supertab'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fireplace'
Plugin 'Twinside/vim-hoogle'
Plugin 'w0rp/ale'

call vundle#end()

filetype plugin indent on
syntax on

set encoding=utf-8
set ttyfast
set mouse=a
set ttymouse=xterm2
set number
set clipboard=unnamedplus
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

autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
autocmd FileType c set tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab
autocmd FileType h set tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab

let g:airline_left_sep=''
let g:airline_right_sep=''

cabbrev %s OverCommandLine<cr>s
cabbrev '<,'>s OverCommandLine<cr>'<,'>s

autocmd BufNewFile,BufRead *.cjsx set syntax=javascript
autocmd BufNewFile,BufRead *.coffee set syntax=javascript

set runtimepath^=~/.vim/bundle/ag

let mapleader=','

inoremap jk <Esc>
inoremap kj <Esc>

set wildmode=longest,list,full
set wildmenu

let $PATH .= (":" . $HOME . "/.cabal/bin" . ":" . $HOME . "/.local/bin")

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <leader>s :VCoolor<CR>

map <leader>q :cclose<bar>:HoogleClose<CR>

highlight LineNr ctermfg=darkgrey

ca ag Ag!
ca Ag Ag!

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

set signcolumn=yes
let g:gitgutter_realtime = 1
let g:gitgutter_sign_added = '+'

set updatetime=250

map <Leader>s :SyntasticToggleMode<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
nnoremap <Leader>l :SyntasticCheck<CR>
nnoremap <Leader>lr :SyntasticReset<CR>
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = 'XX'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_flake8_exec = 'python3'
let g:syntastic_python_flake8_args = ['-m', 'flake8', '--ignore=E501,E225,E302,E305']
let g:syntastic_haskell_checkers = ['ghc_mod', 'hlint']
" let g:syntastic_debug=1

let g:ale_linters = {'haskell': ['stack-build', 'hlint', 'ghc', 'brittany']}
let g:ale_haskell_ghc_options = '-fno-code -v0 -XOverloadedStrings'
let g:ale_haskell_stack_ghc_options = '-fno-code -v0 -XOverloadedStrings -XLambdaCase -XMultiWayIf -XGADTs -XPatternGuards -XViewPatterns -XRecursiveDo -XTupleSections -XExplicitForAll -XImplicitParams -XQuasiQuotes -XTemplateHaskell -XBangPatterns'
" let g:ale_lint_delay = 1000
hi ALEWarning ctermbg=94

let g:ycm_semantic_triggers = {'haskell' : ['.'], 'elm': ['.']}

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.tpl"

nnoremap <Leader>g :GitGutterToggle<CR>

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
map <leader>t :YcmCompleter GoToImprecise<CR>

nnoremap <leader>c :Commentary<C-m>
vnoremap <leader>c :Commentary<C-m>

command W w
command Q q

nnoremap ; :

map <leader>f :FZF<C-m>
map <leader>a :Ag 
map <leader>h :Hoogle

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>
map <leader>t :GhcModCheckAndLint<CR>
" autocmd BufWritePost *.hs GhcModCheckAndLintAsync
" autocmd BufWritePost *.hs call s:check_and_lint()
" function! s:check_and_lint()
"   let l:qflist = ghcmod#make('check', expand('%'))
"   call extend(l:qflist, ghcmod#make('lint', expand('%')))
"   call setqflist(l:qflist)
"   " cwindow
"   if empty(l:qflist)
"     cclose
"   else
"     redraw
"     echo len(l:qflist) . " lines of warnings found by GHC mod. Type ,t to examine"
"   endif
" endfunction
" let g:necoghc_enable_detailed_browse = 1

" Pressing F10 shows the current syntax group to know which highlight colors to change
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),2),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

highlight Comment ctermfg=215

" Ruby syntax highlighting
highlight rubyString ctermfg=Green
highlight rubyInterpolationDelimiter ctermfg=29
highlight rubyInterpolation ctermfg=LightGreen
highlight rubyConstant ctermfg=Red

" Haskell syntax highlighting
highlight ConId ctermfg=LightBlue
highlight hsImport ctermfg=Red
highlight hsVarSym ctermfg=Yellow
highlight hsStatement ctermfg=LightGreen

highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
highlight PmenuSel ctermfg=0 ctermbg=10 guifg=#000000 guibg=#00ff00

let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0

" autocmd VimEnter * ColorHighlight 

augroup HighlightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
augroup END

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

let g:necoghc_debug = 2
let g:necoghc_enable_detailed_browse = 1
let g:necoghc_use_stack = 1
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
vmap a, :Tabularize /,<CR>
" vmap a| :Tabularize /|<CR>

