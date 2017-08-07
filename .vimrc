execute pathogen#infect()
syntax on
filetype plugin indent on
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/syntax/yaml.vim
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
"set lazyredraw
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_python_flake8_options = '--ignore=E501'
highlight CursorLine ctermbg=0 cterm=none
highlight LineNr ctermfg=darkgrey
highlight CursorLineNr ctermfg=grey
highlight StatusLine ctermfg=darkgrey ctermbg=white
nnoremap <silent> <leader># :set nu!<CR>
nnoremap <silent> <leader><space> :set cursorline!<CR>
nnoremap <silent> <leader><esc> :nohlsearch<CR>
nnoremap <silent> <leader>s :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar>syntax enable <Bar> endif<CR>
nnoremap <silent> <leader>l :if g:ale_enabled == 1 <Bar> execute 'sign unplace *'<Bar> call ale#highlight#RemoveHighlights([]) <Bar> let g:ale_enabled = 0 <Bar> else <Bar> let g:ale_enabled = 1 <Bar> ALELint <Bar> endif<CR>
nnoremap <silent> <leader><Tab> :bn<CR>
nnoremap <silent> <leader><S-Tab> :bp<CR>
nnoremap <F5> :w\|!python %<CR>
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


" Statusline
" https://github.com/Greduan/dotfiles/blob/76e16dd8a04501db29989824af512c453550591d/vim/after/plugin/statusline.vim

let g:currentmode={
      \ 'n'  : 'N ',
      \ 'no' : 'N·Operator Pending ',
      \ 'v'  : 'V ',
      \ 'V'  : 'V·Line ',
      \ '' : 'V·Block ',
      \ 's'  : 'Select ',
      \ 'S'  : 'S·Line ',
      \ '' : 'S·Block ',
      \ 'i'  : 'I ',
      \ 'R'  : 'R ',
      \ 'Rv' : 'V·Replace ',
      \ 'c'  : 'Command ',
      \ 'cv' : 'Vim Ex ',
      \ 'ce' : 'Ex ',
      \ 'r'  : 'Prompt ',
      \ 'rm' : 'More ',
      \ 'r?' : 'Confirm ',
      \ '!'  : 'Shell ',
      \ 't'  : 'Terminal '
      \}


" Automatically change the statusline color depending on mode
"function! ChangeStatuslineColor()
"  if (mode() =~# '\v(n|no)')
"    exe 'hi! StatusLine ctermfg=008 gui=None cterm=None'
"  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
"    exe 'hi! StatusLine ctermfg=005 gui=None cterm=None'
"  elseif (mode() ==# 'i')
"    exe 'hi! StatusLine ctermfg=004 gui=None cterm=None'
"  else
"    exe 'hi! StatusLine ctermfg=7 ctermbg=1 gui=None cterm=None'
"  endif

"  return ''
"endfunction

" Find out current buffer's size and output it.
"function! FileSize()
"  let bytes = getfsize(expand('%:p'))
"  if (bytes >= 1024)
"    let kbytes = bytes / 1024
"  endif
"  if (exists('kbytes') && kbytes >= 1000)
"    let mbytes = kbytes / 1000
"  endif
"
"  if bytes <= 0
"    return '0'
"  endif
"
"  if (exists('mbytes'))
"    return mbytes . 'MB '
"  elseif (exists('kbytes'))
"    return kbytes . 'KB '
"  else
"    return bytes . 'B '
"  endif
"endfunction
"
"function! ReadOnly()
"  if &readonly || !&modifiable
"    return '✖'
"  else
"    return ''
"endfunction
"
"function! GitInfo()
"  let git = fugitive#head()
"  if git != ''
"    return ' '.fugitive#head()
"  else
"    return ''
"endfunction

" http://stackoverflow.com/a/10416234/213124
"set laststatus=2
"set statusline=
"set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
"set statusline+=\ %{toupper(g:currentmode[mode()])}   " Current mode
"set statusline+=\ [%n]                                " buffernr
"set statusline+=\ %{GitInfo()}                        " Git Branch name
"set statusline+=\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
"set statusline+=%{ALEGetStatusLine()}             " Syntastic errors
"set statusline+=\ %=                                  " Space
"set statusline+=\ %y\                                 " FileType
"set statusline+=\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
"set statusline+=\ %-3(%{FileSize()}%)                 " File size
"set statusline+=\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (%)
