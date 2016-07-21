call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
set nocompatible
set modelines=0
set laststatus=2
set encoding=utf-8
set t_Co=256

set scrolloff=3

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{fugitive#statusline()}

" sytastic support
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 5

" let g:syntastic_javascript_closurecompiler_path="/home/pi/closurecompiler/compiler.jar"
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_coffee_checkers= ['coffee', 'coffeelint']
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

autocmd FileType typescript setlocal completeopt+=menu,preview
set ballooneval
autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescript nmap <buffer> <Leader>r <Plug>(TsuquyomiRenameSymbol)
autocmd FileType typescript nmap <buffer> <Leader>u <Plug>(TsuquyomiReferences)
autocmd FileType typescript nmap <buffer> <C-b> <Plug>(TsuquyomiDefinition)
autocmd FileType typescript nmap <buffer> <C-[> <Plug>(TsuquyomiGoBack)

"Commands to make auto complete work like I'd expect
autocmd FileType typescript imap <buffer> <C-@> <C-Space>
set completeopt=longest,menuone
autocmd FileType typescript inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd FileType typescript inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

autocmd FileType typescript inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" open omni completion menu closing previous if open and opening new menu without changing the text
autocmd FileType typescript inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" open user completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'




let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_filetype_map = {
  \"coffee": "coffee",
  \"cfe": "coffee",
  \"ts": "typescript",
  \"litcoffee": "coffee" }
let g:syntastic_mode_map = {
  \"mode": "active",
  \"active_filetypes": ["javascript", "coffee", "html", "typescript"],
  \"passive_filetypes": ["java"] }

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set autoindent

set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell

set ttyfast
set ruler
set backspace=indent,eol,start

set relativenumber
set undofile
set undodir=~/.vim/undodir
let mapleader = ","

set ignorecase
set smartcase
set gdefault
set incsearch

set textwidth=79
set formatoptions=qrnl
set colorcolumn=85

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
nnoremap j gj
nnoremap k gk


set list
set listchars=tab:▸\ ,eol:¬

nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Custom directives
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Set to auto read when a file is changed from the outside
set autoread
" Highlight search results
set hlsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set hlsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Be smart when using tabs ;)
set smarttab
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%
set cursorline "highlight current line
set lazyredraw "Redraw only when we need to

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
"space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

"turn on undo toggle
nnoremap \ :GundoToggle<cr>

augroup toggle_relative_number "can be toggled normally with 'cor'
    autocmd!
    autocmd InsertEnter * :setlocal norelativenumber
    autocmd InsertLeave * :setlocal relativenumber
augroup END

let g:auto_save = 1 "Enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0 "do not save while in insert mode

" Add yank and paste for system clipboard
nnoremap \| :YRShow<cr>
nnoremap <leader>p "+p<cr>
nnoremap <leader>yy "+yy<cr>
nnoremap <leader>y "+y<cr>
vnoremap <leader>y "+y<cr>

" Macvim
set guifont=hack:h14
