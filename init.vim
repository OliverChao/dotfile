" change the mapleader to ',' and map the original leader '\' as ','
"
set nocompatible

" Plugin Section
call plug#begin("~/.vim/plugged")


"================themes configuration=============
" theme
" Plug 'fatih/molokai'
Plug 'sainnhe/gruvbox-material'
" format;优化颜色
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" NOTE: hard to say, it fails to work <29-05-22, Oliver> "
" Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'ryanoasis/vim-devicons'

"================statusline & bufferline & file tree==============
" airline & lualine
" lualine
Plug 'SmiteshP/nvim-gps'
Plug 'nvim-lualine/lualine.nvim'
" airline 
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" bufferline; need for lualine;
" if using airline, its tagline is enough
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
" Plug 'scrooloose/nerdtree'
"
"==================useful tools================
" 
Plug 'nvim-lua/plenary.nvim'
" quick select if, af...
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" 当前光标执向的单词显示下划线
Plug 'itchyny/vim-cursorword'
" 搜索显示个数和一些提示
Plug 'kevinhwang91/nvim-hlslens'
" Plug 'petertriho/nvim-scrollbar'
" 快速跳转
Plug 'phaazon/hop.nvim'
" Speed up neovim
Plug 'dstein64/vim-startuptime'
Plug 'nathom/filetype.nvim'
Plug 'lewis6991/impatient.nvim'
" NOTE:https://github.com/mg979/vim-visual-multi
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" nvim-tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
" undotree 
Plug 'mbbill/undotree'
" 高亮显示TODO, NOTE, WARN, FIX...
Plug 'folke/todo-comments.nvim'
" Plug '~/.fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
" NOTE: great git tools <27-05-22, Oliver> "
Plug 'tpope/vim-fugitive'
Plug 'sindrets/diffview.nvim'
Plug 'lewis6991/gitsigns.nvim'

Plug 'tpope/vim-abolish'
Plug 'windwp/nvim-autopairs'

" NOTE: tabular: unknown <22-05-22, Oliver> "
" format tabular: https://github.com/godlygeek/tabular
" useful sometimes, but I haven't explored it.
Plug 'godlygeek/tabular'
"
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'plasticboy/vim-markdown'

Plug 'voldikss/vim-floaterm'

" NOTE: barbaric branch <30-05-22, Oliver> "
Plug 'rlue/vim-barbaric'

" support surround ops
Plug 'kylechui/nvim-surround'

" webapi; Rustplay will use this plugin
Plug 'mattn/webapi-vim'

" a formater
Plug 'sbdchd/neoformat'

" -- fold
" Plug 'kevinhwang91/promise-async'
" Plug 'kevinhwang91/nvim-ufo'
"
" -- quick annotation
Plug 'danymat/neogen'

" -- better quickfix window
Plug 'kevinhwang91/nvim-bqf'

" -- better inner terminal
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
"=================== Coding =====================
" lsp-installer
" Plug 'williamboman/nvim-lsp-installer'
Plug 'williamboman/mason.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'arkav/lualine-lsp-progress'
Plug 'onsails/lspkind-nvim'
" Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig' 
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
"
" -- snips
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'honza/vim-snippets'
"" -- luasnip -- luasnip
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'smjonas/snippet-converter.nvim'

" quickly comment
Plug 'preservim/nerdcommenter'

" NOTE: vim-go and rust.vim are awesome; please use them <29-05-22, Oliver> "
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'rust-lang/rust.vim'

" WARN: rust-tools conflicts with something <29-05-22, Oliver> "
" Plug 'simrat39/rust-tools.nvim'
Plug 'lervag/vimtex'
Plug 'AndrewRadev/splitjoin.vim'

" show indent line
Plug 'Yggdroot/indentLine'
"
" Plug 'roxma/vim-hug-neovim-rpc'
" NOTE: I don't think wilder works enough <26-05-22, Oliver> "
" Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }
"
" -- async run a command
Plug 'skywind3000/asyncrun.vim'
"====================Debug==============
"
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'

call plug#end()

"
" ===============General settings=====================
" 把通用配置放在了前面
if filereadable($HOME . "/.config/nvim/general.vim")
    source $HOME/.config/nvim/general.vim
endif
" ===============General settings END=====================


" ==============AsyncRun==================
" auto open quickfix window with height=6
let g:asyncrun_open = 6
let g:asyncrun_stdin = 1
" =============asyncrun end===============
 

" " ========= vim-visual-multi settings ==========
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-m>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-m>'           " replace visual C-n
let g:VM_mouse_mappings = 1
let g:VM_theme = 'iceblue'
let g:VM_highlight_matches = 'underline'
" let <CR> truly <CR>
noremap <CR> <CR>

" ============== neoformat configuration ===================
augroup fmt
  autocmd!
  autocmd BufWritePre *.go Neoformat goimports | Neoformat gofumpt
  autocmd BufWritePre *.rs Neoformat rustfmt
  autocmd BufWritePre *.cpp Neoformat clangformat 
  autocmd BufWritePre *.sh Neoformat
augroup END
" " ignore error
let g:neoformat_only_msg_on_error = 1
let g:neoformat_cpp_clangformat = {
            \ 'exe': 'clang-format',
            \ 'args': ['-style=llvm'],
            \ }
" neoformat end

"
"===================nvim-cmp=======================
" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect
" Avoid showing extra messages when using completion
set shortmess+=c

"======================Debug configuration===========================
"
"====================Debug configuration END=========================

" ======================barbaric configuration==================
" The IME to invoke for managing input languages (macos, fcitx, ibus, xkb-switch)
let g:barbaric_ime = 'fcitx'

" The input method for Normal mode (as defined by `xkbswitch -g`, `ibus engine`, or `xkb-switch -p`)
" let g:barbaric_default = 0

" The scope where alternate input methods persist (buffer, window, tab, global)
let g:barbaric_scope = 'buffer'

" Forget alternate input method after n seconds in Normal mode (disabled by default)
" Useful if you only need IM persistence for short bursts of active work.
let g:barbaric_timeout = -1

" The fcitx-remote binary (to distinguish between fcitx and fcitx5)
let g:barbaric_fcitx_cmd = 'fcitx5-remote'

" The xkb-switch library path (for Linux xkb-switch users ONLY)
" let g:barbaric_libxkbswitch = $HOME . '/.local/lib/libxkbswitch.so'
" ========================barbaric configuration END================

" custom highlight group(buildin & Treesitter)
hi Comment cterm=NONE ctermfg=245 gui=NONE guifg=#928374
hi GitSignsCurrentLineBlame ctermfg=245 gui=italic guifg=#928374

hi TSKeywordFunction ctermfg=167 gui=italic guifg=#ea6962
hi TSConditional ctermfg=167 gui=italic guifg=#ea6962
hi TSKeywordReturn ctermfg=167 gui=italic guifg=#ea6962
"
"
"
" ========== vim-cursor settings ===========
" let g:cursorword_highlight = 0
let g:cursorword_delay = 0
" autocmd Colorscheme * highlight CursorWord0 cterm=underline gui=underline ctermbg=52 guibg=#303030
" autocmd Colorscheme * highlight CursorWord1 cterm=underline gui=underline ctermbg=52 guibg=#303030
" highlight CursorWord0 cterm=underline gui=underline guisp=#ebcb8b
" highlight CursorWord1 cterm=underline gui=underline guisp=#ebcb8b
" augroup cursorword
"   autocmd!
"   autocmd VimEnter,ColorScheme * call MyHighlight()
" augroup END
" 
" function! MyHighlight() abort
"   highlight CursorWord0 cterm=bold,underline gui=bold,underline
" 
"   redir => out
"     silent! highlight CursorLine
"   redir END
"   execute 'highlight CursorWord1 cterm=underline gui=underline'
"     \ matchstr(out, 'ctermbg=#\?\w\+')
"     \ matchstr(out, 'guibg=#\?\w\+')
" endfunction

" ========== vim-cursor settings ===========
"
"===============显示缩进配置====================================
" golang这种用tab缩进的可以使用以下命令
" set list lcs=tab:\|\ " 后面有一个空格
" " set nolist
""""""""""""""""""""""""""""""""""""""""
"  indentLine highlight configuration  "
""""""""""""""""""""""""""""""""""""""""
" rust ; python 使用空格缩进;需要用插件
" not completed
let g:indentLine_enabled = 1 " 使插件生效
let g:indentLine_char = '¦' " 设置缩进线字符，也可以为 '|', '┆', '┊' 等
" " let g:indentLine_char = 'c' " 设置缩进线字符，也可以为 '|', '┆', '┊' 等
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2 " 使插件正常运行
" let g:indentLine_bgcolor_term = 202
" let g:indentLine_color_gui = '#A4E57E' " 绿色
" let g:indentLine_color_gui = '#6b778d'
" let g:indentLine_color_gui = '#8f9435'
let g:indentLine_color_gui = '#004d61'
" indentLine configuration end
""""""""""""""""""""""""""""""""""""""""""""
"  indentLine highlight configuration END  "
""""""""""""""""""""""""""""""""""""""""""""
"
"
""""""""""""""""""""""""""""""""
"  vim-floaterm configuration  "
""""""""""""""""""""""""""""""""
" 如果用得多, 可以在加更多的快捷键
" let g:floaterm_keymap_new = '<Leader>t'
" let g:floaterm_keymap_kill = '<Leader>t'
let g:floaterm_keymap_toggle = '<Leader>t'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9
" ===


" =========== using luasnip instead of ultisnips =============
"========================快捷键配置===========================
" - https://github.com/nvim-lua/completion-nvim
" let g:UltiSnipsExpandTrigger="<c-space>"
" let g:UltiSnipsExpandTrigger="zz"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" " let g:UltiSnipsSnippetDirectories=["~/.vim/UltiSnips/","UltiSnips"]
" let g:UltiSnipsEditSplit="vertical"
" let g:snips_author='Oliver'
" if !exists("g:UltiSnipsSnippetDirectories")
"     let g:UltiSnipsSnippetDirectories = ["~/.config/nvim/UltiSnips"]
" else
"     let g:UltiSnipsSnippetDirectories += ["~/.config/nvim/UltiSnips"]
" endif
imap <silent><expr> <c-j> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<c-j>'
smap <silent><expr> <c-j> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<c-j>'
""""""""""""""""""""""""""""""""

" ===================主题配置==========================
" molokai 主题已弃用
" let g:rehash256 = 1
" let g:molokai_original = 1
" colorscheme molokai
"
" ========= gruvbox_material settings =======
" https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt
        " Important!!
if has('termguicolors')
  set termguicolors
endif
" For dark version.
set background=dark
" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'
" For better performance
let g:gruvbox_material_better_performance = 1

let g:gruvbox_material_diagnostic_text_highlight = 1
" let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_material_diagnostic_virtual_text = "colored"
let g:gruvbox_material_sign_column_background = 'none'

colorscheme gruvbox-material
" original colorscheme gruvbox configuration: https://github.com/morhetz/gruvbox/wiki/Configuration




" "====================NERDTree 配置===============
" NERDtree已经弃用, 使用下面的nvim-tree.lua
" " quickly open NERDtreeToggle
" nnoremap <C-n> :NERDTreeToggle<CR>


" ========== nvim-tree.lua settings ===========
" defalut hotkeys actions: https://github.com/kyazdani42/nvim-tree.lua#default-actions
" let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
" let g:nvim_tree_highlight_opened_files = 0 "0 by default, will enable folder and file icon highlight for opened files/directories.
" let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
" let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
" let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
" let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
" let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
" let g:nvim_tree_respect_buf_cwd = 0 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
" let g:nvim_tree_create_in_closed_folder = 1 "0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
" let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
" "if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
" "but this will not work when you set indent_markers (because of UI conflict)
" " let g:nvim_tree_auto_open=0
" let g:nvim_tree_show_icons = {
"     \ 'git': 1,
"     \ 'folders': 1,
"     \ 'files': 1,
"     \ 'folder_arrows': 1,
"     \ }

" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them
set termguicolors " this variable must be enabled for colors to be applied properly
highlight NvimTreeFolderIcon guibg=blue



"================vimtex configuration============  
let g:vimtex_view_method = 'zathura'
" disable syntax concel
let g:vimtex_syntax_conceal_disable = 1
" WARN:the fowlling configure is to enable Chinese, but it will fail IEEE conference latex templete. sad....
" let g:vimtex_compiler_latexmk_engines = {
"     \ '_'                : '-xelatex',
"     \}
"
"


" =================== fzf configuration ============
let g:fzf_preview_window = ['right:70%:hidden','ctrl-w']


"=============undotree configuration=============
let g:undotree_WindowLayout = 3



"================快速注释===============
" Nerd commenter configuration
" Create default mappings
" let g:NERDCreateDefaultMappings = 1
let g:NERDCreateDefaultMappings = 0
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_go = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'go': { 'left': '//' },'c':{'left':'//'} }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" ==============tagbar configuration===============
let g:tagbar_width=30
" go-tagbar configuration
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }


" =================bufferline configuration===================
" tabline is the main problem

" 
" ==============airline configuration===============
" 设置状态栏
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#buffer_nr_show = 0
" " let g:airline#extensions#tabline#formatter = 'default'
" " tabline
" let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline#extensions#tabline#enabled = 0
" " let g:airline_theme = 'desertink'  " 主题
" " let g:airline_theme = 'bubblegum'  " 主题
" " let g:airline_theme = 'bubblegum'  " 主题
" " let g:airline_theme = 'deus'  " 主题
" let g:airline_theme = 'zenburn'  " 主题
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#branch#enabled=1
" let g:airline#extensions#keymap#enabled = 1
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#tabline#buffer_idx_format = {
"        \ '0': '0 ',
"        \ '1': '1 ',
"        \ '2': '2 ',
"        \ '3': '3 ',
"        \ '4': '4 ',
"        \ '5': '5 ',
"        \ '6': '6 ',
"        \ '7': '7 ',
"        \ '8': '8 ',
"        \ '9': '9 '
"        \}
" let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr'])
" " let g:airline_section_z = "%l/%L: Col:%c"
" " let g:airline_section_y = ''
" let g:airline_section_y = airline#section#create_right([])
"
" " 修改了一些个人不喜欢的字符
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" " let g:airline_symbols.linenr = "CL" " current line
" " let g:airline_symbols.whitespace = '|'
" " let g:airline_symbols.maxlinenr = 'Ml' "maxline
" " let g:airline_symbols.branch = 'BR'
" " let g:airline_symbols.readonly = "RO"
" " let g:airline_symbols.dirty = "DT"
" " let g:airline_symbols.crypt = "CR"
" "
" "let g:airline_left_sep = '▶'
" "let g:airline_left_alt_sep = '❯'
" "let g:airline_right_sep = '◀'
" "let g:airline_right_alt_sep = '❮'
" " let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.linenr = 'L'
" let g:airline_symbols.colnr = '㏇'
" " let g:airline_section_c = ''
" " let g:airline_symbols.branch = '⎇'
" " let g:airline_symbols.branch = '⎇ '
" "
"
" "============airline configuration EN================

" ===============vim-markdown configuration================
let g:vim_markdown_folding_disabled = 1

let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0


"====================markdown-preview.nvim configuration===========================

" autocmd InsertEnter  *.{markdown,md} set conceallevel=0
" autocmd InsertLeave  *.{markdown,md} set conceallevel=0
" autocmd FileType *.{markdown,md} set conceallevel=0
"
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'dark'
"======markdown-preview.nvim configuration END=============


"===============filetype configuration==============
let g:do_filetype_lua = 1             " load filetype.lua
let g:did_load_filetypes = 0          " don't load filetype.vim
filetype plugin on
filetype indent on
filetype on
filetype plugin indent on


" ============================== Autocmd/Function settings ============================== 
" vim-visual-multi hlslens setting
" NOTE:I get this config from AGou. So does the conf file nvim-vmlens. Its wonderful.
aug VMlens
	au!
	au User visual_multi_start lua require('Oli.nvim-vmlens').start()
	au User visual_multi_exit lua require('Oli.nvim-vmlens').exit()
aug END

"
lua require('Oli')

"======================各种语言配置=================
" 貌似不能把这些配置方法单独放到一个文件里
" golang; rust
if filereadable($HOME . "/.config/nvim/lang-conf.vim")
	source $HOME/.config/nvim/lang-conf.vim
endif


" =========  external keymap settings ==========
if filereadable($HOME . "/.config/nvim/keymaps.vim")
    source $HOME/.config/nvim/keymaps.vim
endif
