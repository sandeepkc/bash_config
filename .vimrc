"Install the command line fuzzy finder
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

"Highlight search after /
set hlsearch

"set color colum at 80 chars boundary
set colorcolumn=80

"Set incremental search highlight
set incsearch

"Command line auto completion in vim
set wildmenu
set wildmode=list:longest,full

"vim color profile
color desert

"Show line numbers
set nu

"Map ";" as fzf hotkey in vim
map ; :FZF<CR>

"Setting for vim-pathogen, needed for vim-fugitive
execute pathogen#infect()
