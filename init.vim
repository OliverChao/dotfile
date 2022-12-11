" change the mapleader to ',' and map the original leader '\' as ','
"
" set nocompatible

" Plugin Section
call plug#begin("~/.vim/plugged")


" ========= colorscheme here. ==========
Plug 'sainnhe/gruvbox-material'
"
" ========= appearence/performance here. ==========
"
Plug 'nvim-lualine/lualine.nvim'
Plug 'dstein64/vim-startuptime'
" -- Speed up neovim
Plug 'nathom/filetype.nvim'
Plug 'lewis6991/impatient.nvim'
" Plug 'SmiteshP/nvim-gps'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
" -- show lsp progress in lualine
Plug 'arkav/lualine-lsp-progress'

" Plug 'max397574/better-escape.nvim'

" ========= useful tools here. ==========
"
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
" -- quick select if, af...
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" -- show same words using underline
Plug 'itchyny/vim-cursorword'
" -- show search numbers
Plug 'kevinhwang91/nvim-hlslens'
" -- quick jump 
Plug 'phaazon/hop.nvim'
" -- docs: https://github.com/mg979/vim-visual-multi
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" -- files tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
" -- undotree 
Plug 'mbbill/undotree'
" -- todo, fix, warn...
Plug 'folke/todo-comments.nvim'
"
" -- using telescope instead of fzf
" Plug '~/.fzf'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
"
" -- search everyting
" Annabelle deeply into unknown regions using the power of the moon.
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'xiyaowong/telescope-emoji.nvim'
Plug 'dhruvmanila/telescope-bookmarks.nvim'
Plug 'keyvchan/telescope-find-pickers.nvim'
Plug 'benfowler/telescope-luasnip.nvim'
" Plug 'nvim-telescope/telescope-ui-select.nvim'
" -- great input&select ui
Plug 'stevearc/dressing.nvim'

Plug 'preservim/tagbar'

" -- git tools 
" Plug 'tpope/vim-fugitive'
Plug 'sindrets/diffview.nvim'
Plug 'lewis6991/gitsigns.nvim'

" Plug 'tpope/vim-abolish'
"
Plug 'windwp/nvim-autopairs'

" -- tabular: 
" format tabular: https://github.com/godlygeek/tabular
Plug 'godlygeek/tabular'
"
" -- markdown tools
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'plasticboy/vim-markdown'

" -- better inner terminal
Plug 'voldikss/vim-floaterm'
" Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

" -- auto switch input methods
Plug 'rlue/vim-barbaric'

" -- support surround ops
Plug 'kylechui/nvim-surround'

" -- webapi;
Plug 'mattn/webapi-vim'

" -- a formater; 
Plug 'sbdchd/neoformat'

" -- fold
Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'
"
" -- quick annotation
Plug 'danymat/neogen'

" -- better quickfix window
Plug 'kevinhwang91/nvim-bqf'

" -- show indent line
" Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

" -- for picgo image bed
Plug 'askfiy/nvim-picgo'

" ========= programming tools here. ==========
" -- lsp-installer
Plug 'williamboman/mason.nvim'
" -- lsp & cmp configs
Plug 'neovim/nvim-lspconfig'
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
" -- a performant UI
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
"
" -- snippets
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'
" Plug 'honza/vim-snippets'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
" Plug 'smjonas/snippet-converter.nvim'

" -- quickly comment
" Plug 'preservim/nerdcommenter'
Plug 'numToStr/Comment.nvim'

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'rust-lang/rust.vim'

" Plug 'simrat39/rust-tools.nvim'
Plug 'lervag/vimtex'
" -- async run a command
Plug 'skywind3000/asyncrun.vim'

" -- debug tools
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'

" Plug 'folke/trouble.nvim'
call plug#end()

"
" ===============General settings=====================
" 把通用配置放在了前面
if filereadable($HOME . "/.config/nvim/general.vim")
    source $HOME/.config/nvim/general.vim
endif

lua require('general')
" ===============General settings END=====================


" ===================主题配置==================
" molokai 主题已弃用
" let g:rehash256 = 1
" let g:molokai_original = 1
" colorscheme molokai
" ========= gruvbox_material settings
" https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt
        " Important!!
" if has('termguicolors')
"   set termguicolors
" endif
" For dark version.
" set background=dark
" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
" let g:gruvbox_material_background = 'hard'
" For better performance
" let g:gruvbox_material_better_performance = 1
"
" let g:gruvbox_material_diagnostic_text_highlight = 1
" " let g:gruvbox_material_diagnostic_line_highlight = 1
" let g:gruvbox_material_diagnostic_virtual_text = "colored"
" let g:gruvbox_material_sign_column_background = 'none'

" colorscheme gruvbox-material
" original colorscheme gruvbox configuration: https://github.com/morhetz/gruvbox/wiki/Configuration
" === custom highlight group(buildin & Treesitter)
" 颜色方案, 参考 AGou 方案
hi Comment cterm=NONE ctermfg=245 gui=NONE guifg=#928374
hi GitSignsCurrentLineBlame ctermfg=245 gui=italic guifg=#928374

" 如果喜欢可以吧 一些特殊关键字 设为斜体
" hi TSKeyword ctermfg=167 gui=italic guifg=#ea6962
" hi TSKeywordFunction ctermfg=167 gui=italic guifg=#ea6962
" hi TSConditional ctermfg=167 gui=italic guifg=#ea6962
hi TSKeyword ctermfg=167 guifg=#ea6962
hi TSKeywordFunction ctermfg=167 guifg=#ea6962
hi TSConditional ctermfg=167 guifg=#ea6962
hi TreesitterContext ctermfg=223 ctermbg=237 guifg=#ddc7a1 guibg=#3c3836
hi NormalFloat ctermfg=223 ctermbg=237 guifg=#ddc7a1 guibg=#1E2021
hi FloatBorder  ctermfg=142 guifg=#a9b665 guibg=#1E2021
" hi InclineNormal ctermfg=223 ctermbg=237 gui=italic guifg=#ddc7a1 guibg=#3c3836
hi lualine_c_inactive ctermfg=223 ctermbg=237 gui=italic guifg=#ddc7a1 guibg=#3c3836
" hi FocusedSymbol cterm=italic ctermfg=4 ctermbg=11 gui=bold,italic guifg=#181A1A guibg=#77814C
" hi ErrorText cterm=undercurl ctermbg=52 gui=italic guibg=#442e2d guisp=#ea6962

" ==============AsyncRun==================
" auto open quickfix window with height=6
" let g:asyncrun_open = 6
" let g:asyncrun_stdin = 1
" =============asyncrun end===============
 

" " ========= vim-visual-multi settings ==========
" let g:VM_maps = {}
" let g:VM_maps['Find Under']         = '<F2>'           " replace C-n
" let g:VM_maps['Find Subword Under'] = '<F2>'           " replace visual C-n
" let g:VM_mouse_mappings = 1
" let g:VM_theme = 'iceblue'
" let g:VM_highlight_matches = 'underline'
" " let <CR> truly <CR>
" noremap <CR> <CR>

" ============== neoformat configuration =================
" augroup fmt
"   autocmd!
"   " autocmd BufWritePre *.go Neoformat goimports | Neoformat gofumpt
"   autocmd BufWritePre *.go Neoformat goimports
"   autocmd BufWritePre *.rs Neoformat rustfmt
"   autocmd BufWritePre *.cpp Neoformat clangformat 
"   autocmd BufWritePre *.sh Neoformat
" augroup END
" " " ignore error
" let g:neoformat_only_msg_on_error = 1
" let g:neoformat_cpp_clangformat = {
"             \ 'exe': 'clang-format',
"             \ 'args': ['-style=llvm'],
"             \ }
" neoformat end

"
"===================nvim-cmp=======================
" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
" set completeopt=menuone,noinsert,noselect
" " Avoid showing extra messages when using completion
" set shortmess+=c

" ======================barbaric configuration==================
" " The IME to invoke for managing input languages (macos, fcitx, ibus, xkb-switch)
" let g:barbaric_ime = 'fcitx'
"
" " The input method for Normal mode (as defined by `xkbswitch -g`, `ibus engine`, or `xkb-switch -p`)
" " let g:barbaric_default = 0
"
" " The scope where alternate input methods persist (buffer, window, tab, global)
" let g:barbaric_scope = 'buffer'
"
" " Forget alternate input method after n seconds in Normal mode (disabled by default)
" " Useful if you only need IM persistence for short bursts of active work.
" let g:barbaric_timeout = -1
"
" " The fcitx-remote binary (to distinguish between fcitx and fcitx5)
" let g:barbaric_fcitx_cmd = 'fcitx5-remote'
"
" " The xkb-switch library path (for Linux xkb-switch users ONLY)
" " let g:barbaric_libxkbswitch = $HOME . '/.local/lib/libxkbswitch.so'
" ========================barbaric configuration END================

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

" ============ vim-floaterm ===========
" 如果用得多, 可以在加更多的快捷键
" let g:floaterm_keymap_new = '<Leader>t'
" let g:floaterm_keymap_kill = '<Leader>t'
" let g:floaterm_keymap_toggle = '<Leader>t'
" let g:floaterm_width = 0.9
" let g:floaterm_height = 0.9
" ===

"================vimtex configuration============  
" let g:vimtex_view_method = 'zathura'
" " disable syntax concel
" let g:vimtex_syntax_conceal_disable = 1
" WARN:the fowlling configure is to enable Chinese, but it will fail IEEE conference latex templete. sad....
"
" let g:vimtex_compiler_latexmk_engines = {
"     \ '_'                : '-xelatex',
"     \}
"
" =================== fzf configuration ============
" let g:fzf_preview_window = ['right:70%:hidden','ctrl-w']

"=============undotree configuration=============
" let g:undotree_WindowLayout = 3

" Using Comment.nvim instead
" "===============NerdCommenter================
" " Nerd commenter configuration
" " Create default mappings
" " let g:NERDCreateDefaultMappings = 1
" let g:NERDCreateDefaultMappings = 0
" " Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
" " Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
" " Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'
" " Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_go = 1
" " Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'go': { 'left': '//' },'c':{'left':'//'} }
" " Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1
" " Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1
" " Enable NERDCommenterToggle to check all selected lines is commented or not 
" let g:NERDToggleCheckAllLines = 1

" ==============tagbar configuration===============
" let g:tagbar_width=30
" go-tagbar configuration
" let g:tagbar_type_go = {
" 	\ 'ctagstype' : 'go',
" 	\ 'kinds'     : [
" 		\ 'p:package',
" 		\ 'i:imports:1',
" 		\ 'c:constants',
" 		\ 'v:variables',
" 		\ 't:types',
" 		\ 'n:interfaces',
" 		\ 'w:fields',
" 		\ 'e:embedded',
" 		\ 'm:methods',
" 		\ 'r:constructor',
" 		\ 'f:functions'
" 	\ ],
" 	\ 'sro' : '.',
" 	\ 'kind2scope' : {
" 		\ 't' : 'ctype',
" 		\ 'n' : 'ntype'
" 	\ },
" 	\ 'scope2kind' : {
" 		\ 'ctype' : 't',
" 		\ 'ntype' : 'n'
" 	\ },
" 	\ 'ctagsbin'  : 'gotags',
" 	\ 'ctagsargs' : '-sort -silent'
" \ }

" ===============vim-markdown configuration================
" let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_conceal = 0
" let g:tex_conceal = ""
" let g:vim_markdown_math = 1
" let g:vim_markdown_conceal_code_blocks = 0

"====================markdown-preview.nvim configuration===========================
" " autocmd InsertEnter  *.{markdown,md} set conceallevel=0
" " autocmd InsertLeave  *.{markdown,md} set conceallevel=0
" " autocmd FileType markdown set conceallevel=0
" "
" " set to 1, nvim will open the preview window after entering the markdown buffer
" " default: 0
" let g:mkdp_auto_start = 0
"
" " set to 1, the nvim will auto close current preview window when change
" " from markdown buffer to another buffer
" " default: 1
" let g:mkdp_auto_close = 0
"
" " set to 1, the vim will refresh markdown when save the buffer or
" " leave from insert mode, default 0 is auto refresh markdown as you edit or
" " move the cursor
" " default: 0
" let g:mkdp_refresh_slow = 0
"
" " set to 1, the MarkdownPreview command can be use for all files,
" " by default it can be use in markdown file
" " default: 0
" let g:mkdp_command_for_global = 0
"
" " set to 1, preview server available to others in your network
" " by default, the server listens on localhost (127.0.0.1)
" " default: 0
" let g:mkdp_open_to_the_world = 0
"
" " use custom IP to open preview page
" " useful when you work in remote vim and preview on local browser
" " more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" " default empty
" let g:mkdp_open_ip = ''
"
" " specify browser to open preview page
" " for path with space
" " valid: `/path/with\ space/xxx`
" " invalid: `/path/with\\ space/xxx`
" " default: ''
" let g:mkdp_browser = ''
"
" " set to 1, echo preview page url in command line when open preview page
" " default is 0
" let g:mkdp_echo_preview_url = 0
"
" " a custom vim function name to open preview page
" " this function will receive url as param
" " default is empty
" let g:mkdp_browserfunc = ''
"
" " options for markdown render
" " mkit: markdown-it options for render
" " katex: katex options for math
" " uml: markdown-it-plantuml options
" " maid: mermaid options
" " disable_sync_scroll: if disable sync scroll, default 0
" " sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
" "   middle: mean the cursor position alway show at the middle of the preview page
" "   top: mean the vim top viewport alway show at the top of the preview page
" "   relative: mean the cursor position alway show at the relative positon of the preview page
" " hide_yaml_meta: if hide yaml metadata, default is 1
" " sequence_diagrams: js-sequence-diagrams options
" " content_editable: if enable content editable for preview page, default: v:false
" " disable_filename: if disable filename header for preview page, default: 0
" let g:mkdp_preview_options = {
"     \ 'mkit': {},
"     \ 'katex': {},
"     \ 'uml': {},
"     \ 'maid': {},
"     \ 'disable_sync_scroll': 0,
"     \ 'sync_scroll_type': 'middle',
"     \ 'hide_yaml_meta': 1,
"     \ 'sequence_diagrams': {},
"     \ 'flowchart_diagrams': {},
"     \ 'content_editable': v:false,
"     \ 'disable_filename': 0,
"     \ 'toc': {}
"     \ }
"
" " use a custom markdown style must be absolute path
" " like '/Users/username/markdown.css' or expand('~/markdown.css')
" let g:mkdp_markdown_css = ''
"
" " use a custom highlight style must absolute path
" " like '/Users/username/highlight.css' or expand('~/highlight.css')
" let g:mkdp_highlight_css = ''
"
" " use a custom port to start server or empty for random
" let g:mkdp_port = ''
"
" " preview page title
" " ${name} will be replace with the file name
" let g:mkdp_page_title = '「${name}」'
"
" " recognized filetypes
" " these filetypes will have MarkdownPreview... commands
" let g:mkdp_filetypes = ['markdown']
"
" " set default theme (dark or light)
" " By default the theme is define according to the preferences of the system
" let g:mkdp_theme = 'dark'
"======markdown-preview.nvim configuration END=============


" vim-visual-multi hlslens setting
" NOTE:I get this config from AGou. So does the conf file nvim-vmlens. Its wonderful.
" aug VMlens
" 	au!
" 	au User visual_multi_start lua require('Oli.nvim-vmlens').start()
" 	au User visual_multi_exit lua require('Oli.nvim-vmlens').exit()
" aug END

" import lua files
" lua require('Oli')
lua require('core')

"==================coding language settings==================
if filereadable($HOME . "/.config/nvim/lang-conf.vim")
	source $HOME/.config/nvim/lang-conf.vim
endif

" =========  external keymap settings ==========
if filereadable($HOME . "/.config/nvim/keymaps.vim")
    source $HOME/.config/nvim/keymaps.vim
endif
