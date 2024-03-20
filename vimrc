set nocompatible          	" required
filetype off              	" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here
Plugin 'tpope/vim-abolish'
Plugin 'tmhedberg/SimpylFold'
"Python Indentation
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tell-k/vim-autopep8'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
"Syntax highlighting / checking
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'python-mode/python-mode'
"Tree view
Plugin 'scrooloose/nerdtree'
"Comment/Uncomment blocks of code
Plugin 'scrooloose/nerdcommenter'
"color scheme
" Plugin 'jnurmine/Zenburn'
"Plugin 'lifepillar/vim-solarized8'
Plugin 'altercation/vim-colors-solarized'
"git interface
"Plugin 'tpope/vim-fugitive'
"Status line config
if !has('nvim')
  Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
endif
Plugin 'rdnetto/YCM-Generator'
Plugin 'vim-scripts/taglist.vim'
"Markdown support
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"Tasklist
Plugin 'TaskList.vim'
" Highlihght and strip trailing whitespace
Plugin 'ntpeters/vim-better-whitespace'
"Gist
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" All of your plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on	" required

filetype plugin on

" See docstrings for folded code
let g:SimpylFold_docstring_preview=1

" Disable folding of markdown code
let g:vim_markdown_folding_disabled=1

au BufRead,BufNewFile *.py,*.uts,*.dot,*.c,*.h,*.cc,*.cpp,*.go
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2

au BufRead,BufNewFile *.txt
	\ set textwidth=80

au BufRead,BufNewFile *.m
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

" Flag extraneous whitespace
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Folding for c code
au BufRead,BufNewFile *.c,*.h,*.cpp,*.cc
	\ set foldmethod=syntax |
	\ normal zR

" Folding for python code
au BufRead,BufNewFile *.py normal zR

" Default to utf-8 encoding
set encoding=utf-8

" Search for the tags file is higher level directories
set tags=tags;/

" Linebreak mode when softwrapping
set linebreak

" YouCompleteMe customizations
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Enable syntax highlighting
let python_highlight_all=1
syntax on

" Setup colorscheme
"colorscheme solarized8_dark
"colorscheme solarized

" taglist plugin shortcuts and settings
noremap <silent> <F8> :TlistToggle<CR>
noremap <silent> <F9> :TlistShowTag<CR

" NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>

set nu
set clipboard=unnamed

set ignorecase
set smartcase

" Remember position in file when reopening
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Make backspace on OS X delete over line breaks and auto-indent
set backspace=indent,eol,start

" Status line config
set laststatus=2
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y
"set statusline+=\ %{fugitive#statusline()}
"set statusline+=%=[col:%2c][line:%l/%L]\ %P

