
"let g:pathogen_disabled = ['vim-sexp', 'vim-sexp-mappings-for-regular-people']
let g:pathogen_disabled = ['nvim-parinfer.js', 'rainbow']
execute pathogen#infect('bundle/{}', 'nbundle/{}')
let t_Co = 256
colorscheme peachpuff
syntax on
let g:rainbow_active = 1
"Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
"let g:parinfer_airline_integration = 0

set nonu

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

"disable sexp
"let g:sexp_enable_insert_mode_mappings = 0
"
"let g:loaded_sexp_mappings_for_regular_people = 1 " hack to disable

" set omnifunc=syntaxcomplete#Complete

" nnoremap <tab> <C-X><C-O>
