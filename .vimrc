filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" everything in its right place
Plugin 'VundleVim/Vundle.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'shemerey/vim-peepopen'
Plugin 'ngmy/vim-rubocop'
Plugin 'tpope/vim-commentary'
Plugin 'junegunn/fzf'
Plugin 'vim-airline/vim-airline'
Plugin 'Shougo/neocomplete'
Plugin 'jiangmiao/auto-pairs'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
Plugin 'alvan/vim-closetag'
Plugin 'eagletmt/neco-ghc'
Plugin 'ElmCast/elm-vim'
Plugin 'pbrisbin/vim-syntax-shakespeare'
Plugin 'KabbAmine/vCoolor.vim'	
Plugin 'mattn/emmet-vim'
Plugin 'tpope/tpope-vim-abolish'
Plugin 'osyo-manga/vim-over'
Plugin 'godlygeek/tabular'
Plugin 'tidalcycles/vim-tidal'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'ervandew/supertab'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fireplace'
Plugin 'Twinside/vim-hoogle'
Plugin 'w0rp/ale'
Plugin 'hdima/python-syntax'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'sjl/gundo.vim'
Plugin 'easymotion/vim-easymotion'

call vundle#end()

filetype plugin indent on
syntax on

" all the small things / true care truth brings
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
set updatetime=250
set runtimepath^=~/.vim/bundle/ag
set wildmode=longest,list,full
set wildmenu

""" IMPORTANT

" easy escaping
inoremap jk <Esc>
inoremap kj <Esc>


""" LEADER SHORTCUTS

" 40000^100000
let mapleader=','

" close little windows that get in the way
map <leader>q :cclose<bar>:HoogleClose<CR>

" comment stuff out
nnoremap <leader>c :Commentary<C-m>
vnoremap <leader>c :Commentary<C-m>

" fast searching for files, strings in directory, and type signatures
map <leader>f :FZF<C-m>
map <leader>a :Ag 
map <leader>h :Hoogle

" toggle the git gutter (duh)
nnoremap <Leader>g :GitGutterToggle<CR>

" heX color picker
map <leader>x :VCoolor<CR>

" syntax checking
map <Leader>s :SyntasticToggleMode<CR>

" browse the undo tree
nnoremap <leader>u :GundoToggle<CR>

" jump to any word or line quickly
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map <Leader>n <Plug>(easymotion-bd-jk)
nmap <Leader>n <Plug>(easymotion-overwin-line)

" align on various common syntactic elements
let g:haskell_tabular = 1
vmap <leader>= :Tabularize /=<CR>
vmap <leader>:: :Tabularize /::<CR>
vmap <leader>-> :Tabularize /-><CR>
vmap <leader>. :Tabularize /,<CR>


""" SYNTAX HIGHLIGHTING

" pressing F10 shows the current syntax group to know which highlight colors to change
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),2),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" general syntax highlighting
highlight Comment ctermfg=215
highlight String ctermfg=Green
highlight LineNr ctermfg=darkgrey

" python syntax highlighting
let python_highlight_all = 1
highlight pythonNumber ctermfg=Magenta
highlight pythonBuiltinFunc cterm=Bold ctermfg=Cyan
highlight Entity cterm=Bold ctermfg=LightBlue
highlight pythonBuiltInObj ctermfg=LightGreen
highlight pythonExClass ctermfg=Red
highlight pythonParamName ctermfg=LightMagenta
highlight pythonPreCondit ctermfg=Blue

" ruby syntax highlighting
highlight rubyInterpolationDelimiter ctermfg=29
highlight rubyInterpolation ctermfg=LightGreen
highlight rubyConstant ctermfg=Red

" haskell syntax highlighting
highlight ConId ctermfg=LightBlue
highlight hsImport ctermfg=Red
highlight hsVarSym ctermfg=Yellow
highlight hsStatement ctermfg=LightGreen

highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
highlight PmenuSel ctermfg=0 ctermbg=10 guifg=#000000 guibg=#00ff00

" highlight TODOs
augroup HighlightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
augroup END


""" GENERAL

" forgive failures to hit the shift key in common situations
command W w
command Q q
nnoremap ; :
ca ag Ag!
ca Ag Ag!

" number of spaces per 'tab'. default is 2
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
autocmd FileType c set tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab
autocmd FileType h set tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab

" custom filetypes
augroup filetypedetect
    au BufRead,BufNewFile *.pxl set filetype=pixll
augroup END
autocmd BufNewFile,BufRead *.cjsx set syntax=javascript
autocmd BufNewFile,BufRead *.coffee set syntax=javascript

" make airline minimalist
let g:airline_left_sep=''
let g:airline_right_sep=''
" multiline stuff
cabbrev %s OverCommandLine<cr>s
cabbrev '<,'>s OverCommandLine<cr>'<,'>s

" cabal, please play nice with my path
let $PATH .= (":" . $HOME . "/.cabal/bin" . ":" . $HOME . "/.local/bin")

" tree view
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" git gutter
set signcolumn=yes
let g:gitgutter_realtime = 1
let g:gitgutter_sign_added = '+'

" linting
let g:ale_linters =
  \ { 'haskell': ['ghc_mod', 'stack-build', 'hlint', 'ghc', 'brittany']
  \ , 'python': ['pylint', 'pycodestyle', 'pydocstyle', 'flake8']
  \ }
let g:ale_haskell_ghc_options = '-fno-code -v0 -XOverloadedStrings'
let g:ale_haskell_stack_ghc_options = '-fno-code -v0 -XOverloadedStrings -XLambdaCase -XMultiWayIf -XGADTs -XPatternGuards -XViewPatterns -XRecursiveDo -XTupleSections -XExplicitForAll -XImplicitParams -XQuasiQuotes -XTemplateHaskell -XBangPatterns'
hi ALEWarning ctermbg=94

" completion
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" haskell type analysis stuff
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <leader> t :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>
map <leader>tl :GhcModCheckAndLint<CR>
" (commented out for now because they make things slow)
" autocmd BufWritePost *.hs GhcModCheckAndLintAsync
" autocmd BufWritePost *.hs call s:check_and_lint()
function! s:check_and_lint()
  let l:qflist = ghcmod#make('check', expand('%'))
  call extend(l:qflist, ghcmod#make('lint', expand('%')))
  call setqflist(l:qflist)
  if empty(l:qflist)
    cclose
  else
    redraw
    echo len(l:qflist) . " lines of warnings found by GHC mod. Type ,t to examine"
  endif
endfunction
let g:necoghc_enable_detailed_browse = 1

" check spelling of markdown files
augroup markdownSpell
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal spell
augroup END

" tab completion
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

" necoghc
let g:necoghc_debug = 2
let g:necoghc_enable_detailed_browse = 1
let g:necoghc_use_stack = 1
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" template for creating a new blog post
command Post call PostGen()
function! PostGen()
  call inputsave()
  let title = input('Title: ')
  let subtitle = input('Subtitle: ')
  call inputrestore()
  call append('.', '')
  call append('.', "# " . title)
  call append('.', '')
  call append('.', '-->')
  call append('.', strftime('%Y-%m-%d'))
  call append('.', subtitle)
  call append('.', title)
  call append('.', "<!---")
  execute 'normal dd Go'
endfunction

" wrap 'example' as '<img src="/images//example.jpg" width="100%">'
command Image execute "normal 0i<img src=\"/images//\<esc>A.jpg\" width=\"100%\">\<esc>0f/f/f/"
