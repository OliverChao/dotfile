" filetype settings
" let g:do_filetype_lua = 1             " load filetype.lua
" let g:did_load_filetypes = 0          " don't load filetype.vim

" INFO: filetype and syntax are enabled by default in nvim.
" see: https://neovim.io/doc/user/vim_diff.html#nvim-defaults
"
" filetype plugin on
" filetype indent on
" filetype on
"
" syntax enable
" let mapleader=","
" noremap \ ,

" set autoindent
" set autowrite
" set ruler
" set smartindent

" set lazyredraw
" scroll-off
" set scrolloff=3
"
" set number
" set cmdheight=2
" set cmdheight=1
" set report=0           " always report number of lines changed
" relatived number
" set relativenumber

" set ignorecase "设置默认大小写不敏感查找
" set smartcase "如果有大小写字母，则切换到大小写敏感查找

" have a fixed column for the diagnostics to appear in
" " this removes the jitter when warnings/errors flow in
" set signcolumn=yes:1
" set signcolumn=yes
" set hlsearch

"============== tabstop shitwitdth ==============
" set shiftwidth=4 softtabstop=4
" " if there exist some indentation problems, maybe set tabstop=8
" set tabstop=4

" set expandtab
" autocmd FileType php,ruby,yaml set tabstop=2 shiftwidth=2 softtabstop=2
" autocmd FileType c,cpp set tabstop=2 shiftwidth=2 softtabstop=2
" autocmd FileType go set noexpandtab tabstop=4 shiftwidth=4
" autocmd FileType coffee,javascript set tabstop=2 shiftwidth=2 softtabstop=2
" autocmd FileType python set tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
" autocmd FileType html,html,django,xhtml,haml set tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
" autocmd FileType sass,scss,css set tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
" autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown
"  """""""""""""""""""

" set mouse=nvi
" set mousehide
" set splitbelow
" set splitright

" set updatetime=500
" turn off swap files
" set nobackup
" set noswapfile
" set nowb

" Vim jump to the last position when reopening a file
" if has("autocmd")
"   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"     \| exe "normal! g'\"" | endif
" endif


" set fileencodings=utf-8
" set termencoding=utf-8
" set encoding=utf-8


" ================ Folds ============================
" set foldmethod=indent   "fold based on indent
" set foldnestmax=3       "deepest fold is 3 levels
" set nofoldenable        "dont fold by default
" set foldlevel=100
"
" let g:vim_json_conceal=0
"
"
" set guifont=JetBrainsMonoNL\ Nerd\ Font\ Mono:h12
" set  guifont=JetBrains\ Mono\ NL:h15
" neovide configuration
if exists("g:neovide")
    " Put anything you want to happen only in Neovide here
    inoremap <c-space> <nop>

    let g:neovide_scale_factor = 1.0
    let g:neovide_remember_window_size = v:true

    let g:neovide_cursor_vfx_mode = "railgun"
    let g:neovide_no_idle=v:true
    let g:neovide_hide_mouse_when_typing = v:true

    " g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    " let g:neovide_transparency = 0.8
    " let g:transparency = 0.8
    " let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))
endif
