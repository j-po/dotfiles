let g:python_host_prog = '/Users/jpol.polin/.config/nvim/pypy_env/bin/pypy'
let g:python3_host_prog = '/Users/jpol.polin/.config/nvim/pypy3_env/bin/pypy3'
set rtp+=/usr/local/opt/fzf
execute pathogen#infect('bundle/{}')
"colorscheme peachpuff
syntax on
filetype plugin indent on
set background=dark
colorscheme solarized
let g:rainbow_active = 1
"Activation based on file type
" augroup rainbow_lisp
"   autocmd!
"   autocmd FileType lisp,clojure,scheme
" augroup END
"let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow_conf = {
\	'ctermfgs': ['darkblue', 'darkred', 'darkgreen', 'darkyellow', 'darkcyan', 'darkmagenta']
\}
let g:ackprg = 'ag --nogroup --nocolor --column'

autocmd FileType yaml setlocal ts=2 sts=3 sw=2 expandtab

"let g:parinfer_airline_integration = 0
"
set nonu
set ruler

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set timeout
set timeoutlen=750
set ttimeoutlen=250

"NeoVim handles ESC keys as alt+key, set this to solve the problem
if has('nvim')
     set ttimeout
     set ttimeoutlen=0
endif
