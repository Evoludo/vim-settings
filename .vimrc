execute pathogen#infect()
syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set showcmd
set cursorline
set showmatch
set hlsearch
set laststatus=2
set lazyredraw
highlight CursorLine ctermbg=darkgray cterm=none
highlight LineNr ctermfg=darkgrey
highlight CursorLineNr ctermfg=grey
highlight StatusLine ctermfg=darkgrey ctermbg=white
nnoremap <leader># :set nu!<CR>
nnoremap <leader><space> :set cursorline!<CR>
nnoremap <leader><esc> :nohlsearch<CR>
nnoremap <leader>s :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar>syntax enable <Bar> endif<CR>
set pastetoggle=<leader>p
set viminfo=%,<800,'10,/50,:100,h,f0,n~/.vim/cache/.viminfo
"           | |    |   |   |    | |  + viminfo file path
"           | |    |   |   |    | + file marks 0-9,A-Z 0=NOT stored
"           | |    |   |   |    + disable 'hlsearch' loading viminfo
"           | |    |   |   + command-line history saved
"           | |    |   + search history saved
"           | |    + files marks saved
"           | + lines saved each register (old name for <, vi6.2)
"           + save/restore buffer list
set dir=~/.vim/tmp
au BufRead,BufNewFile *.md set filetype=markdown
