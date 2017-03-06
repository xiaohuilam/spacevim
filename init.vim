let mapleader = "`"
let g:spacevim_plugin_manager = "vim-plug"
let g:spacevim_colorscheme = 'jellybeans'
let g:spacevim_unite_leader = '@@'
let g:spacevim_enable_googlesuggest = 0

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/main.vim'
