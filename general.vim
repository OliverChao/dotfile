let mapleader=","
noremap \ ,

set autoindent
set autowrite
set ruler
set smartindent

" scroll-off
" set scrolloff=3
"
set number
set cmdheight=2
set updatetime=200

" relatived number
set relativenumber
" set relativenumber
" augroup toggle_relative_number
"     autocmd InsertEnter * :setlocal norelativenumber
"     autocmd InsertLeave * :setlocal relativenumber
"
set ignorecase "设置默认大小写不敏感查找
set smartcase "如果有大小写字母，则切换到大小写敏感查找

set shiftwidth=4 softtabstop=4
" if there exist some indentation problems, maybe set tabstop=8
set tabstop=4
set hlsearch

" have a fixed column for the diagnostics to appear in
" " this removes the jitter when warnings/errors flow in
" set signcolumn=yes:1
set signcolumn=yes

"""""""""""""""""""""""""""""""""""""""
"  expandtab for sepecial type files  "
"  """""""""""""""""""""""""""""""""""""""
autocmd FileType rust set expandtab
autocmd FileType python set expandtab
autocmd FileType tex set expandtab
autocmd FileType md set expandtab
autocmd FileType txt set expandtab
"""""""""""""""""""
"  expandtab end  "
"  """""""""""""""""""

syntax enable
set mouse=nvi
filetype plugin indent on
" set guifont=Ubuntu\ Mono:h20
" set guifont
set  guifont=DroidSansMono\ Nerd\ Font\ Mono:h15
" set splitbelow
set splitright

" turn off swap files
set nobackup
set noswapfile
set nowb

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif



set fileencodings=utf-8
set termencoding=utf-8
set encoding=utf-8
