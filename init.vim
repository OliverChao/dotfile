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
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
" Plug 'scrooloose/nerdtree'
"
"==================useful tools================
" 
Plug 'nvim-lua/plenary.nvim'
" 当前光标执向的单词显示下划线
Plug 'itchyny/vim-cursorword'
" 搜索显示个数和一些提示
Plug 'kevinhwang91/nvim-hlslens'
" Plug 'petertriho/nvim-scrollbar'
" 快速跳转
Plug 'phaazon/hop.nvim'
" Speed up neovim
Plug 'lewis6991/impatient.nvim'
" there is a bug in VM; and I fail to fix it
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" nvim-tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
" undotree 
Plug 'mbbill/undotree'
" 高亮显示TODO, NOTE, WARN, FIX...
Plug 'folke/todo-comments.nvim'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'windwp/nvim-autopairs'

"=================== Coding =====================
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" quickly comment
Plug 'preservim/nerdcommenter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'

Plug 'AndrewRadev/splitjoin.vim'

" NOTE: tabular: unknown <22-05-22, Oliver> "
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'voldikss/vim-floaterm'
" show indent line
Plug 'Yggdroot/indentLine'
"
" Plug 'roxma/vim-hug-neovim-rpc'
"     " Install this plugin
" Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }
" Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
"
call plug#end()

"
" ===============General settings=====================
" 把通用配置放在了前面
if filereadable($HOME . "/.config/nvim/general.vim")
    source $HOME/.config/nvim/general.vim
endif
" ===============General settings END=====================

" lua << END
" require('lualine').setup()
" END

" lua require("Oli")

" color schemes
  "if (has("termguicolors"))
  "set termguicolors
  "endif
 "colorscheme evening
 "colorscheme dracula
 

" " ========= vim-visual-multi settings ==========
" there is a bug or conflict with current plugins; VM fails to start.
" let g:VM_maps = {}
" let g:VM_maps['Find Under']         = '<cr>'           " replace C-n
" let g:VM_maps['Find Subword Under'] = '<cr>'           " replace visual C-n
" let g:VM_mouse_mappings = 1
" let g:VM_theme = 'iceblue'
" let g:VM_highlight_matches = 'underline'




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


autocmd FileType go let b:coc_pairs_disabled = ['<']
autocmd FileType rust let b:coc_pairs_disabled = ['<']
" unenbale the '<' auto-pair
let b:coc_pairs_disabled = ['<']
" autocmd FileType html let b:coc_pairs_disabled = []


""""""""""""""""""""""""""""""""
"  vim-floaterm configuration  "
""""""""""""""""""""""""""""""""
" 如果用得多, 可以在加更多的快捷键
" let g:floaterm_keymap_new = '<Leader>t'
" let g:floaterm_keymap_kill = '<Leader>t'
let g:floaterm_keymap_toggle = '<Leader>t'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
" ===


"========================快捷键配置===========================
" - https://github.com/nvim-lua/completion-nvim
" let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsExpandTrigger="zz"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsSnippetDirectories=["~/.vim/UltiSnips/","UltiSnips"]
let g:UltiSnipsEditSplit="vertical"
let g:snips_author='Oliver'
if !exists("g:UltiSnipsSnippetDirectories")
	let g:UltiSnipsSnippetDirectories = ["~/.vim/UltiSnips/"]
else
	let g:UltiSnipsSnippetDirectories += ["~/.vim/UltiSnips/"]
endif
""""""""""""""""""""""""""""""""
"  coc-snippets configuration  "
""""""""""""""""""""""""""""""""
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" let g:coc_snippet_next = '<tab>'
" =============




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


"================TagbarToggle settings==========================
" quickly open TagbarToggle
nnoremap <A-n> :TagbarToggle<CR>


" "====================NERDTree 配置===============
" NERDtree已经弃用, 使用下面的nvim-tree.lua
" " quickly open NERDtreeToggle
" nnoremap <C-n> :NERDTreeToggle<CR>


" ========== nvim-tree.lua settings ===========
" defalut hotkeys actions: https://github.com/kyazdani42/nvim-tree.lua#default-actions
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 0 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 0 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 1 "0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)
" let g:nvim_tree_auto_open=0
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
" conflict with my vim-go plugin and create new file
" nnoremap <leader>r :NvimTreeRefresh<CR>
" nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them
set termguicolors " this variable must be enabled for colors to be applied properly
highlight NvimTreeFolderIcon guibg=blue



"================vimtex configuration============  
let g:vimtex_view_method = 'zathura'
" disable syntax concel
let g:vimtex_syntax_conceal_disable = 1

"
"


" ===============neovide configuration=========
" let g:neovide_transparency=0.9
" let g:neovide_fullscreen=v:true
let g:neovide_cursor_vfx_mode = "railgun"
let g:neovide_no_idle=v:true


" =================== fzf configuration ============
let g:fzf_preview_window = ['right:70%:hidden','ctrl-w']
noremap <leader>ff :<C-u>Files<CR>
noremap <leader>fm :<C-u>Marks<CR>
noremap <leader>fr :<C-u>Rg<CR>
noremap <leader>b :<C-u>Buffers<CR>
noremap <leader>l :<C-u>Lines<CR>
" noremap <leader>b :<C-u>Lines<CR>
" 把:W 映射为:w; 因为很容易触发:W
command! -nargs=0 W :w 


"=============undotree configuration=============
" nnoremap <F5> :UndotreeToggle<CR>
nnoremap <leader>h :UndotreeToggle <bar> :UndotreeFocus<CR>
let g:undotree_WindowLayout = 3


"================Coc-markdown configuration==========
nnoremap <silent><nowait> <space>m :<C-u>CocCommand markdown-preview-enhanced.openPreview<CR>
" set encoding
"

"================快速注释===============
" Nerd commenter configuration
" Create default mappings
let g:NERDCreateDefaultMappings = 1
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
nmap <A-1> <Cmd>BufferLineGoToBuffer 1<CR>
nmap <A-2> <Cmd>BufferLineGoToBuffer 2<CR>
nmap <A-3> <Cmd>BufferLineGoToBuffer 3<CR>
nmap <A-4> <Cmd>BufferLineGoToBuffer 4<CR>
nmap <A-5> <Cmd>BufferLineGoToBuffer 5<CR>
nmap <A-6> <Cmd>BufferLineGoToBuffer 6<CR>
nmap <A-7> <Cmd>BufferLineGoToBuffer 7<CR>
nmap <A-8> <Cmd>BufferLineGoToBuffer 8<CR>
nmap <A-9> <Cmd>BufferLineGoToBuffer 9<CR>

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
" " 设置切换tab的快捷键 <Alt> + <i> 切换到第i个 tab
" " nmap <A-1> <Plug>AirlineSelectTab1
" " nmap <A-2> <Plug>AirlineSelectTab2
" " nmap <A-3> <Plug>AirlineSelectTab3
" " nmap <A-4> <Plug>AirlineSelectTab4
" " nmap <A-5> <Plug>AirlineSelectTab5
" " nmap <A-6> <Plug>AirlineSelectTab6
" " nmap <A-7> <Plug>AirlineSelectTab7
" " nmap <A-8> <Plug>AirlineSelectTab8
" " nmap <A-9> <Plug>AirlineSelectTab9
" " 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
" " nmap <leader>1 <Plug>AirlineSelectTab1
" " nmap <leader>2 <Plug>AirlineSelectTab2
" " nmap <leader>3 <Plug>AirlineSelectTab3
" " nmap <leader>4 <Plug>AirlineSelectTab4
" " nmap <leader>5 <Plug>AirlineSelectTab5
" " nmap <leader>6 <Plug>AirlineSelectTab6
" " nmap <leader>7 <Plug>AirlineSelectTab7
" " nmap <leader>8 <Plug>AirlineSelectTab8
" " nmap <leader>9 <Plug>AirlineSelectTab9
" " 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
" " nmap <leader>- <Plug>AirlineSelectPrevTab
" " " 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
" " nmap <leader>+ <Plug>AirlineSelectNextTab
" " 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
" " 不好用, 换为<A-q>
" " nmap <leader>q :bp<cr>:bd #<cr>
" " close a TAB <Alt-q>
" " 比<leader>q执行的快
"
" "============airline configuration EN================
" close a tag quickly
nmap <A-q> :bp<cr>:bd #<cr>
"

" ========= wilder command bar settings ==========
" Default keys
" call wilder#setup({'modes': [':', '/', '?']})
"
" " warnning: 增加以下配置会增加nvim启动时间（大概60ms）
" call wilder#set_option('pipeline', [
"       \   wilder#branch(
"       \     wilder#python_file_finder_pipeline({
"       \       'file_command': ['rg', '--files'],
"       \       'dir_command': ['find', '.', '-type', 'd', '-printf', '%P\n'],
"       \       'filters': ['fuzzy_filter', 'difflib_sorter'],
"       \     }),
"       \     wilder#cmdline_pipeline(),
"       \     wilder#python_search_pipeline(),
"       \   ),
"       \ ])
" call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
"             \ 'border': 'rounded',
"             \ 'highlighter': wilder#basic_highlighter(),
"               \ 'min_width': '15%',
"               \ 'min_height': '1%',
"             \ 'highlights': {
"                 \   'border': 'Normal',
"                 \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
"                 \ },
"                 \ 'left': [
"                     \   ' ', wilder#popupmenu_devicons(),
"                     \ ],
"                     \ 'right': [
"                         \   ' ', wilder#popupmenu_scrollbar(),
"                         \ ],
"                         \ })))


" ============================== Autocmd/Function settings ============================== 
" vim-visual-mutil hlslens setting
aug VMlens
	au!
	au User visual_multi_start lua require('Oli.nvim-vmlens').start()
	au User visual_multi_exit lua require('Oli.nvim-vmlens').exit()
aug END


" highlight the text when yank something.
" augroup YankHighlight
"     autocmd!
"     au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
" augroup end
"
"
lua require('Oli')

"======================各种语言配置=================
" 貌似不能把这些配置方法单独放到一个文件里
" golang; rust
if filereadable($HOME . "/.config/nvim/lang-conf.vim")
	source $HOME/.config/nvim/lang-conf.vim
endif

"
"====================Coc 配置=======================
if filereadable($HOME . "/.config/nvim/coc-conf.vim")
	source $HOME/.config/nvim/coc-conf.vim
endif

" book chapter 19
" --relativenumber
"
" set number
" set relativenumber
" augroup toggle_relative_number
"     autocmd InsertEnter * :setlocal norelativenumber
"     autocmd InsertLeave * :setlocal relativenumber

" =========  external keymap settings ==========
if filereadable($HOME . "/.config/nvim/keymaps.vim")
    source $HOME/.config/nvim/keymaps.vim
endif
