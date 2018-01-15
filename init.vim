call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'

Plug 'https://github.com/tpope/vim-surround.git' 

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'https://github.com/w0rp/ale.git'

Plug 'iCyMind/NeoSolarized'

Plug 'https://github.com/jiangmiao/auto-pairs.git'

Plug 'https://github.com/pangloss/vim-javascript.git'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

Plug 'zchee/deoplete-clang'

call plug#end()

if !exists("g:syntax_on")
    syntax enable
endif

set termguicolors
set background="dark"
colorscheme NeoSolarized
set number

set laststatus=2

let g:lightline = {
            \ 'colorscheme': 'solarized',
            \ 'component': {
            \   'readonly': '%{&readonly?"":""}',
            \ },
            \ 'separator':    { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' },
            \ }
let g:ale_sign_column_always = 1
let g:ale_sign_warning = ''
let g:ale_sign_error = ''

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

set conceallevel=1

let g:deoplete#enable_at_startup = 1
set completeopt="menu"

let g:deoplete#sources = {}
let g:deoplete#sources.javascript = ['buffer', 'tern']
let g:deoplete#sources#ternjs#include_keywords = 1

let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang/3.8.0/include/'

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
set tabstop=4
set shiftwidth=4
set expandtab

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

