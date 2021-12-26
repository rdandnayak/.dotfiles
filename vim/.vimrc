set scrolloff=8
set number
set relativenumber
set clipboard=unnamed
set tw=80
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autochdir
set incsearch
set nohlsearch
set autochdir


call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'github/copilot.vim'
Plug 'cocopon/iceberg.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'leafgarland/typescript-vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'moll/vim-node'
Plug 'tpope/vim-fugitive'
Plug 'makerj/vim-pdf'
Plug 'preservim/nerdtree'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'yegappan/mru'
call plug#end()



autocmd FileType netrw setl bufhidden=delete

set nocompatible
set path+=**

let g:airline#extensions#tabline#formatter = 'ctrlspace'


autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif


:let g:NERDTreeWinSize=60


"packloadall
set laststatus=2
let g:prettier#autoformat_require_pragma = 0
let g:prettier#config#print_width = '80'
let g:ale_fixers = {
\   'javascript': ['eslint','prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'html': ['prettier'],
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\}
let g:ale_fix_on_save = 1
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
let g:coc_global_extension = ['coc-json', 'coc-html', 'coc-css', 'coc-tslint', 'coc-prettier', 'coc-tsserver', 'coc-angular']

"set termguicolors
"set background="dark"
set bg=dark
try
  colorscheme gruvbox
catch
endtry

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

syntax on
syntax enable

"Mode Settings

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Turn on the Wild menu
set wildmenu

set wildignore=*.o,*~,*.pyc,**/node_modules/**,**/dist/**
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*,**/node_modules/**,**/dist/**
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,**/node_modules/**,**/dist/**
endif

set ruler
" Height of the command bar
set cmdheight=1
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


let mapleader = " "

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader><C-f> :silent !tmux neww tmux-sessionizer<CR>
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.vimrc<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <C-n> :NERDTreeFind<CR>
nnoremap <C-e> :MRU<CR>
nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader><C-a> :Ack!<Space>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


" vim fugitive
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>x :!chmod +x % //2<CR>

source ~/.coc.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
