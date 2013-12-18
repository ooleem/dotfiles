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
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Plugins {
Bundle "tpope/vim-fugitive"
Bundle "ervandew/supertab"
Bundle "rking/ag.vim"
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'

" Navigation
Bundle "kien/ctrlp.vim"
Bundle "scrooloose/nerdtree"

" Programming
Bundle "groenewege/vim-less"
Bundle "kchmck/vim-coffee-script"
Bundle "nono/vim-handlebars"
Bundle "slim-template/vim-slim"
Bundle "tpope/vim-commentary"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-rails"
Bundle "vim-ruby/vim-ruby"
Bundle "leshill/vim-json"
Bundle "pangloss/vim-javascript"
Bundle "tpope/vim-rake"
Bundle "tpope/vim-haml"
Bundle "tpope/vim-repeat"
Bundle "vim-scripts/matchit.zip"
Bundle "othree/html5.vim"
Bundle "tpope/vim-bundler"
Bundle "alfredodeza/jacinto.vim"

" Utility"
Bundle "Rykka/colorv.vim"
Bundle "godlygeek/tabular"
Bundle "vim-scripts/AutoTag"
Bundle "vim-scripts/ZoomWin"

" Vroom
Bundle "skalnik/vim-vroom"
let g:vroom_map_keys = 0
map <leader>t :VroomRunTestFile<cr>
map <leader>T :VroomRunNearestTest<cr>

" Colorscheme
Bundle "altercation/vim-colors-solarized"
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
" }

filetype plugin indent on   " required!
" }

" Highlight extra white spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" }

