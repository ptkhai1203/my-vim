
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

map <C-c> :s/^/\/\//<Enter>
map <C-u> :s/^\/\///<Enter>

map <F8> :call single_file_runner#do_make()<cr>
map <F9> :exec single_file_runner#get_execute_command()<cr>

function Tmpl()
   :0r ~/.vim/template/cp.cpp
endfunction
function Db()
    :r ~/.vim/template/dbg.cpp
endfunction
func! SetupCP()
    let cp_languages = ['cpp', 'c', 'java', 'pascal', 'javascript', 'python', 'kotlin', 'lua', 'rust']
    func! SetIO() abort closure
        unlet! b:single_file_input
        unlet! b:single_file_output
        unlet! b:single_file_error
        if index(cp_languages, &filetype) == -1
            return
        endif
        if confirm("Setup IO for cp???", "&Yes\n&No", 1) != 1
            return
        endif
        let b:single_file_input = "main.inp"
        let b:single_file_output = "main.out"
        let b:single_file_error = ".log"
        echom "All set"
    endfunc

    augroup CPSetup
        au!
        autocmd BufRead,BufNewFile * call SetIO()
    augroup END
endfunc
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256

