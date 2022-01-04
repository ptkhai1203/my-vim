
set nocompatible
set encoding=utf-8
set t_Co=256
set background=dark
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }

colorscheme mmolokai

syntax on
filetype plugin indent on
set bs=2 tabstop=4 softtabstop=4 shiftwidth=4 expandtab
hi Normal guibg=NONE ctermbg=NONE
hi! NonText ctermbg=NONE guibg=NONE
set aw 
set autoindent cindent
set nowrap textwidth=0
set nu ruler showcmd
set incsearch ignorecase smartcase
set scrolloff=5
set splitright splitbelow
set clipboard=unnamedplus
set cursorline
set scroll=8
set wildmenu
set autoread
inoremap (<cr> (<cr>)<c-o><s-o>
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" set cc=80 
set hlsearch
set foldmethod=marker
set fillchars=vert:\│
filetype indent plugin on

