set nocompatible
set enc=utf-8
set fenc=utf-8
map <Tab> :buffers<CR>
set backspace=indent,eol,start
set nobackup
set shiftwidth=2
set tabstop=2
set scrolloff=2
set smarttab
set expandtab
set hidden
syntax on
filetype plugin on
set showmatch
set showmode
set showcmd
set ruler
set nohlsearch
set incsearch
set wildmenu

"highlighting
hi Comment    term=bold ctermfg=yellow    ctermbg=DarkBlue guifg=Blue
hi PreProc    ctermfg=White
hi Directory  term=bold ctermfg=LightBlue
hi String     ctermfg=LightRed
hi Constant   ctermfg=LightRed
hi Search     ctermbg=DarkRed
" Preview menu entries and selection
hi PmenuSel   term=bold ctermfg=LightBlue ctermbg=Black
hi Pmenu      term=bold ctermfg=White     ctermbg=DarkRed
"highlight trailing whitepace and spaces before a tab in red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

"spelling
set spellfile=~/.vim/spellfile.add
set spelllang=en_us
hi SpellBad   cterm=undercurl ctermbg=Black ctermfg=Red
hi SpellCap   cterm=underline ctermbg=Black
hi SpellRare   cterm=underline ctermbg=Black
hi SpellLocal   cterm=underline ctermbg=Black

"configure plugins and interplay with wm
let g:yankring_history_file = '.yankring_history'
set titlestring=vim\ %{expand(\"%:p\")}
set title

"insert ISO date macro
iab idate <ESC>:r !date -I<CR>kJA
"mappings
map K k
map Y y$
map \w :call Browser ()<CR>
set pastetoggle=<F8>
nnoremap <silent> <F10> :YRShow<CR>
map <F11> :WMToggle<cr>
map <F12> :TlistToggle<CR>

function! Browser ()
  let line0 = getline (".")
  let line = matchstr (line0, "http[^ ]*")
  :if line==""
  let line = matchstr (line0, "ftp[^ ]*")
  :endif
  :if line==""
  let line = matchstr (line0, "file[^ ]*")
  :endif
  let line = escape (line, "#?&;|%")
  :if line==""
  let line = "\"" . (expand("%:p")) . "\""
  :endif
  exec ':silent !firefox ' . line
  :redraw!
endfunction
