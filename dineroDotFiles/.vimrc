set nocompatible              " be iMproved, required
filetype off                  " required

" ----------- Custom Functions -------------------

" thanks to http://vimcasts.org/e/4
function! StripTrailingWhitespace()
  let previous_search=@/
  let previous_cursor_line=line('.')
  let previous_cursor_column=col('.')
  %s/\s\+$//e
  let @/=previous_search
  call cursor(previous_cursor_line, previous_cursor_column)
endfunction

" strip trailing whitespace on Ruby buffer saves
augroup whitespace
  autocmd BufWritePre *.rb call StripTrailingWhitespace()
augroup END


" enable syntax highlighting
syntax enable

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
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Plugin 'altercation/vim-colors-solarized'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'             "Language syntax checking
Plugin 'airblade/vim-gitgutter'           "Use '<leader>g' to show git diff
Plugin 'nathanaelkane/vim-indent-guides'  "Use '<leader>ig' to highlight indentation
Plugin 'kien/ctrlp.vim'                   "Fuzzy file searching. Use '<leader>t' to search filename
Plugin 'rking/ag.vim'                     "Ack, silver searcher.  Use '<leader>a' to search term.
Plugin 'vim-scripts/matchit.zip'          "Use '%' to move cursor between block openings and endings

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




" ----------- VIM Settings -------------------
"
"Turn off swap files
set nobackup
set nowritebackup
set noswapfile

" Highlight column 80
set colorcolumn=80
highlight ColorColumn ctermbg=DarkGray guibg=#444555

"set switchbuf=newtab                                        " Open a duplicate file in a new tab, don't go to a tab where it's already open.

"set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
"set backspace=2                                              " Fix broken backspace in some setups
"set backupcopy=yes                                           " see :help crontab
"set clipboard=unnamed                                        " yank and paste with the system clipboard
"set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set smartcase                                                " case-sensitive search if any caps
set hlsearch
"set incsearch                                                " search as you type
"set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set title 						     " automatically update to the name of the currently opened file
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set showcmd
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

" Tab options
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=8                                                " actual tabs occupy 8 characters

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
set ttymouse=xterm2
endif

" Fix Cursor in TMUX
if exists('$TMUX')
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" ----------- Keyboard Shortcuts -------------------
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
"noremap <leader>l :Align
"Ack search
nnoremap <leader>a :Ag<space>
"nnoremap <leader>b :CtrlPBuffer<CR>
"let g:gitgutter_enabled = 0
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
"nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader><space> :call StripTrailingWhitespace()<CR>
nnoremap <leader>g :GitGutterToggle<CR>
"noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

"easy save
nnoremap <leader>w :w<CR>

"escape from insert w/ jk
:imap jk <Esc>

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

" ----------- Plugin settings -------------------

"let g:ctrlp_match_window = 'order:ttb,max:20'
"let g:NERDSpaceDelims=1 "Adds extra space For NERD commenter
let NERDTreeShowHidden=1 "show dot files and hidden files

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
"if executable('ag')
"  " Use Ag over Grep
"  set grepprg=ag\ --nogroup\ --nocolor
"
"  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

" ----------- Language settings -------------------

"Setting tab options for specific languages
augroup myfiletypes
"clear old autocmds in group
autocmd!
"for ruby, autoindent with two spaces, always expand tabs
autocmd FileType ruby,haml,eruby,yaml set sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et
autocmd FileType javascript set sw=2 sts=2 et
augroup END


"source *.as as flash files
autocmd BufRead *.as set filetype=actionscript
autocmd BufRead *.mxml set filetype=mxml

"source *.ino, *.pde as arduino files
autocmd BufRead *.ino set filetype=arduino
autocmd BufRead *.pde set filetype=arduino

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml

" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell


" ----------- ColorScheme -------------------
colorscheme solarized
