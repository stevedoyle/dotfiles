set runtimepath^=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='simple'

" treesitter
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

