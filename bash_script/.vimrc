set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" plugin for perl syntax, template toolkit
Plugin 'vim-perl/vim-perl'
" plugin for javascript syntax
Plugin 'pangloss/vim-javascript'
" plugin for json syntax
Plugin 'elzr/vim-json'
" plugin to easy find file
Plugin 'kien/ctrlp.vim'
" tree explorer
Plugin 'scrooloose/nerdtree'
" NERDTree git integration
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Status line
Plugin 'vim-airline/vim-airline'
" HTML Syntax
Plugin 'othree/html5.vim'
" Mojo html.ep
Plugin 'yko/mojo.vim'
" Markdown highlighter
Plugin 'plasticboy/vim-markdown'
" Butter smooth scrolling
Plugin 'terryma/vim-smooth-scroll'
" See git changes
Plugin 'airblade/vim-gitgutter'
" Sensible commenting capabilities
Plugin 'scrooloose/nerdcommenter'
" Themes
Plugin 'tomasr/molokai'
" Async Linting
Plugin 'w0rp/ale'
" Code tags
Plugin 'majutsushi/tagbar'
map <Leader>t :CtrlPBuffer<CR>
 let g:ctrlp_map = '<C-p>'
 let g:ctrlp_working_path_mode = 0 " don’t manage working directory.
 let g:ctrlp_use_caching = 1
 let g:ctrlp_by_filename = 1
 let g:ctrlp_custom_ignore = {
 \ 'dir':  '\v\c\.(git|svn)$|cgi/t/sandbox|cover_db',
 \ 'file': '\v\c\.(swf|bak|png|gif|js|mov|ico|jpg|pdf|jrxml)$'
  \ }

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set autoindent
set backspace=indent,eol,start
set cindent " set smartindent
set cmdheight=2
set cursorcolumn
set cursorline
set errorformat=\"../../%f\"\\,%*[^0-9]%l:\ %m
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:>-,trail:-
set mouse=c
set nowrap
set ruler
set scrolloff=5
set shiftwidth=4
set showcmd
set showmatch
set smarttab
"set statusline=%F%m%r%h%w\ [%{&ff}]\ %y\ [CHR=%b/0x%B]\ [POS=%04l,%03c(%03v)]\ [%p%%]\ [LEN=%L]\ %{fugitive#statusline()}
set t_Co=256
set tags=tags;/
set virtualedit=block
set wrap
"set nu
"set spell spelllang=en_us
set colorcolumn=80
syntax on

highlight   CursorColumn  term=NONE    cterm=none ctermbg=232
highlight   CursorLine    term=NONE    cterm=bold ctermbg=8
highlight   FoldColumn                            ctermbg=8  ctermfg=14
highlight   Folded                                ctermbg=8  ctermfg=14
highlight   Search        term=reverse cterm=bold ctermbg=11 ctermfg=0
highlight   Visual        term=NONE    cterm=bold ctermbg=10 ctermfg=8
highlight   ColorColumn                           ctermbg=8

"" makes Omni Completion less pinky :P
highlight   Pmenu                                 ctermbg=2  ctermfg=0
highlight   PmenuSel                              ctermbg=7  ctermfg=0
highlight   PmenuSbar                             ctermbg=0  ctermfg=7
highlight   PmenuThumb                            ctermbg=7  ctermfg=0

" :help last-position-jump
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"""""""""""""""""""
" Plugin Config
"""""""""""""""""""

map <F5> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" NERDCommenter settings
let g:NERDSpaceDelims = 1

" Git gutter update interval
set updatetime=500

" Smooth scroll config
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 15, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 15, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 15, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 15, 4)<CR>

"ALE perl checking
let g:ale_perl_perlcritic_profile = "/home/git/regentmarkets/cpan/rc/.perlcriticrc"
let g:ale_perl_perltidy_profile = "/home/git/regentmarkets/cpan/rc/.perltidyrc"
let g:ale_linters = { 'perl': ['perl','perlcritic','perltidy'] }
let g:ale_fixers = { 'perl':['perltidy'] }
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 1 " Less distracting when opening a new file
let g:ale_fix_on_save = 1

""""""""""""""""""""""
" Custom Key Mappings
""""""""""""""""""""""

nnoremap <C-L> :noh<CR><C-L>
inoremap jj <Esc>
nnoremap <Leader>r :source ~/.vimrc<CR>
nnoremap <Leader><Leader>r :e ~/.vimrc<CR>

map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gm :Gcommit --amend<CR>
map <Leader>gll :Git log<CR>
map <Leader>glp :Git log -p<CR>
map <Leader>gb :Gblame<CR>
map <Leader>gdd :Git diff<CR>
map <Leader>gdm :Git diff %<CR>
map <Leader>gdf :Gdiff<CR>
map <Leader>gg :Git

map <Leader>] :wa<bar><UP><CR>

nmap <F1> <Esc>
imap <F1> <Esc>

autocmd FileType gitcommit autocmd! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" navigate display line when wrap is set
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk


"""""""""""""""""""
" Custom Functions
"""""""""""""""""""

"kill buffers with out closing windows
command! Bd b#|bd#

"define :Tidy command to run perltidy on visual selection || entire buffer"
command! -range=% -nargs=* Tidy <line1>,<line2>!perltidy -pro="/home/git/regentmarkets/cpan/rc/.perltidyrc"

"run :Tidy on entire buffer and return cursor to (approximate) original position"
function! DoTidy()
    let l = line(".")
    let c = col(".")
    :Tidy
    call cursor(l, c)
endfun


"""""""""""""""""""
" Color Theme
"""""""""""""""""""
color molokai
