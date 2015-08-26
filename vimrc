" General {
set nocompatible          " disable vi compatibility.
set history=256           " Number of things to remember in history.
set autowrite             " Writes on make/shell commands
set autoread
set timeoutlen=250        " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed    " Yanks go on clipboard instead.

" Backup
set nowritebackup
set nobackup
set directory=/tmp//      " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)

set hidden                " The current buffer can be put to the background without writing to disk

set hlsearch              " highlight search
set ignorecase            " Do case in sensitive matching with
set smartcase		          " be sensitive when there's a capital letter
set incsearch
" }

" Formatting {
set fo+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)

set wrap
set textwidth=0		        " Don't wrap lines by default

set backspace=indent,eol,start " more powerful backspacing

set tabstop=2             " Set the default tabstop
set softtabstop=2
set shiftwidth=2          " Set the default shift width for indents
set expandtab             " Make tabs into spaces (set by tabstop)
set smarttab              " Smarter tab levels
set foldlevelstart=20

syntax on                 " enable syntax
" }

" Visual {
set number                " Show line numbers
set showmatch             " Show matching brackets.
set matchtime=5           " Bracket blinking.
set novisualbell          " No blinking
set noerrorbells          " No noise.
set laststatus=2          " Always show status line.
set vb t_vb=              " disable any beeps or flashes on error
set ruler                 " Show ruler
set showcmd               " Display an incomplete command in the lower right corner of the Vim window
set equalalways

set splitbelow
set splitright

" Auto commands {
au BufRead,BufNewFile {Gemfile,config.ru,*.thor}  set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}     set ft=markdown
au BufRead,BufNewFile {COMMIT_EDITMSG}            set ft=gitcommit
" }

" Key mappings {
" Clear last search highlighting
nnoremap <Space> :noh<cr>

let mapleader = ","         " Change leader key

" Navigating between windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Keep content after pasting
vnoremap <leader>p "_dP

" Run cucumber {
silent! map <unique> <Leader>w :!bundle exec cucumber --profile=wip<CR>

" Fix for rvm
set shell=/bin/sh

set pastetoggle=<F2>

vnoremap <leader><leader> Commentary
" }

" sudo write
cmap w!! %!sudo tee > /dev/null %

" Search {
function! VisualSelection()
  try
    let a_save = @a
    normal! gv"ay
    return @a
  finally
    let @a = a_save
  endtry
endfunction

function! SearchProjectForSelect()
  exec ":Ag \"" . VisualSelection() . "\""
endfunction

map <leader>s :call SearchProjectForSelect()<cr>
" }

" Vundle {
filetype off                " required!

" Setup Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'

" Plugins {
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'rking/ag.vim'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'

" Navigation
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" Programming
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nono/vim-handlebars'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'leshill/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/matchit.zip'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-bundler'
Plugin 'alfredodeza/jacinto.vim'

" Utility"
Plugin 'Rykka/colorv.vim'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/AutoTag'
Plugin 'vim-scripts/ZoomWin'

" Vroom
Plugin 'skalnik/vim-vroom'

" Ag
let g:ag_prg="ag --column --nogroup

" Colorscheme
Plugin 'altercation/vim-colors-solarized'
" }

call vundle#end()
filetype plugin indent on   " required!
" }

" Vroom
let g:vroom_map_keys = 0
map <leader>t :VroomRunTestFile<cr>
map <leader>T :VroomRunNearestTest<cr>

" Colorscheme
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Highlight extra white spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" }
