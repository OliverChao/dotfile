" change the mapleader to ',' and map the original leader '\' as ','
"
let mapleader=","
noremap \ ,

set autoindent
set autowrite
set ruler
set smartindent
"
" relatived number
set relativenumber

map <Leader>1 ^
map <Leader>2 $
" 括号匹配
" 弃用, 因为有了coc-pairs 插件
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap ' ''<ESC>i
" inoremap " ""<ESC>i
set ignorecase "设置默认大小写不敏感查找
set smartcase "如果有大小写字母，则切换到大小写敏感查找

set shiftwidth=4 softtabstop=4
" if there exist some indentation problems, maybe set tabstop=8
set tabstop=4
set hlsearch
set number

"
"""""""""""""""""""""""""""""""""""""""
"  expandtab for sepecial type files  "
"""""""""""""""""""""""""""""""""""""""
autocmd FileType rust set expandtab
autocmd FileType python set expandtab
autocmd FileType tex set expandtab
autocmd FileType md set expandtab
autocmd FileType txt set expandtab
"""""""""""""""""""
"  expandtab end  "
"""""""""""""""""""


noremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l> 
function! VisualStarSearchSet(cmdtype,...)
  let temp = @"
  normal! gvy
  if !a:0 || a:1 != 'raw'
    let @" = escape(@", a:cmdtype.'\*')
  endif
  let @/ = substitute(@", '\n', '\\n', 'g')
  let @/ = substitute(@/, '\[', '\\[', 'g')
  let @/ = substitute(@/, '\~', '\\~', 'g')
  let @/ = substitute(@/, '\.', '\\.', 'g')
  let @" = temp
endfunction

" replace vim's built-in visual * and # behavior
xnoremap * :<C-u>call VisualStarSearchSet('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call VisualStarSearchSet('?')<CR>?<C-R>=@/<CR><CR>

" %% in command mode will auto expand to current direction
cnoremap <expr> %% getcmdtype()==':'?expand('%:h').'/' : '%%'

syntax enable
set mouse=nvi
filetype plugin indent on
" set guifont=Ubuntu\ Mono:h20
set  guifont=DroidSansMono\ Nerd\ Font:h17
" set splitbelow
set splitright
" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" move line or visually selected block - alt+j/k
" == will make a line indented
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
" gv in normal mode will re-select the previous visual selection.
" = will make selected lines indented
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" in insertion mode; ctrl-k to delete a line
" inoremap <C-K>  <Esc>ddO
"
"
"
"
" quickly move for windows
nnoremap <A-h> <C-W>h
nnoremap <A-j> <C-W>j
nnoremap <A-k> <C-W>k
nnoremap <A-l> <C-W>l
nnoremap <A-c> <C-W>c


" inoremap <S-w> <Esc><S-o>
" Press i to enter insert mode, and ii to exit insert mode.
" :inoremap ii <Esc>
" Plugin Section
call plug#begin("~/.vim/plugged")
" Plug 'dracula/vim'
Plug 'fatih/molokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'rust-lang/rust.vim'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'
Plug 'tpope/vim-abolish'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'OliverChao/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'voldikss/vim-floaterm'
" show indent line
Plug 'Yggdroot/indentLine'
call plug#end()
" color schemes
  "if (has("termguicolors"))
  "set termguicolors
  "endif
 "colorscheme evening
 "colorscheme dracula
 "

" tab language like golang indentation
" set list lcs=tab:\|\ " 后面有一个空格
" " set nolist
"
" indentLine configuration for blanks indentation language:
" rust ; python
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

inoremap <c-p> <nop>
inoremap <c-n> <nop>
inoremap <c-j> <nop>
" inoremap <c-k> <nop>
"
" - https://github.com/nvim-lua/completion-nvim
" let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsExpandTrigger="zz"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsSnippetDirectories=["~/.vim/UltiSnips/","UltiSnips"]
let g:UltiSnipsEditSplit="vertical"
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

let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai



" quickly open NERDtreeToggle
nnoremap <C-n> :NERDTreeToggle<CR>
" quickly open TagbarToggle
nnoremap <A-n> :TagbarToggle<CR>


""""""""""""""""""""""""""
"  vimtex configuration  "
""""""""""""""""""""""""""
let g:vimtex_view_method = 'zathura'
" disable syntax concel
let g:vimtex_syntax_conceal_disable = 1

"
"
"
""""""""""""""""""""""""""""
"  vim-go configuration    "
""""""""""""""""""""""""""""
 " 禁用vim-go自动加载的ultisnips,
 " 否则不能使用自己定义的ultisnips
let g:go_loaded_gosnippets = 0

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1

let g:go_auto_type_info=1

let g:go_list_type = "quickfix"
set updatetime=100
" go-vim map configuration. 
" autocmd FileType go nmap <leader>b <Plug>(go-build)
" autocmd FileType go nmap <leader>r <Plug>(go-run)
" autocmd FileType go nmap <leader>f <Plug>(go-fmt)
" autocmd FileType go nmap <silent><leader>b  <Plug>(go-build)
autocmd FileType go nmap <silent><leader>r  <Plug>(go-run)
autocmd FileType go nmap <silent><leader>f  <Plug>(go-fmt)

" if settng the <nowait>, coc-rename will fail, because <leader>r without waiting will make <leader>rn un work. 
" autocmd FileType go nmap <silent><nowait><leader>b  <Plug>(go-build)
" autocmd FileType go nmap <silent><nowait><leader>r  <Plug>(go-run)
" autocmd FileType go nmap <silent><nowait><leader>f  <Plug>(go-fmt)

" Use new vim 8.2 popup windows for Go Doc
" let g:go_doc_popup_window = 1

" neovide configuration
" let g:neovide_transparency=0.9
" let g:neovide_fullscreen=v:true
let g:neovide_cursor_vfx_mode = "railgun"
let g:neovide_no_idle=v:true


""""""""""""""""""""""""
"  fzf configuration   "
""""""""""""""""""""""""
let g:fzf_preview_window = ['right:70%:hidden','ctrl-w']
noremap <leader>ff :<C-u>Files<CR>
noremap <leader>fm :<C-u>Marks<CR>
noremap <leader>fr :<C-u>Rg<CR>
noremap <leader>b :<C-u>Buffers<CR>
noremap <leader>l :<C-u>Lines<CR>
" noremap <leader>b :<C-u>Lines<CR>
" 把:W 映射为:w; 因为很容易触发:W
command! -nargs=0 W :w 

" rust-vim configuration
" enable automatic running of :RustFmt when you save a buffer.
let g:rustfmt_autosave = 1
autocmd FileType rust noremap <silent><leader>r :Cargo run<CR>
autocmd FileType rust noremap <silent><leader>f :RustFmt<CR>
" similar as golang, <nowait> will coc-rename unwork.
" autocmd FileType rust noremap <silent><nowait><leader>r :RustRun<CR>
" autocmd FileType rust noremap <silent><nowait><leader>f :RustFmt<CR>

nnoremap <silent><nowait> <space>m :<C-u>CocCommand markdown-preview-enhanced.openPreview<CR>
" set encoding
set fileencodings=utf-8
set termencoding=utf-8
set encoding=utf-8

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


" tagbar configuration
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

" airline configuration
" 设置状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
" let g:airline_theme = 'desertink'  " 主题
let g:airline_theme = 'bubblegum'  " 主题
" let g:airline_theme = 'bubblegum'  " 主题
" let g:airline_theme = 'deus'  " 主题
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}

" 修改了一些个人不喜欢的字符
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" let g:airline_symbols.linenr = "CL" " current line
" let g:airline_symbols.whitespace = '|'
" let g:airline_symbols.maxlinenr = 'Ml' "maxline
" let g:airline_symbols.branch = 'BR'
" let g:airline_symbols.readonly = "RO"
" let g:airline_symbols.dirty = "DT"
" let g:airline_symbols.crypt = "CR"
" 
"let g:airline_left_sep = '▶'
"let g:airline_left_alt_sep = '❯'
"let g:airline_right_sep = '◀'
"let g:airline_right_alt_sep = '❮'
" let g:airline_symbols.linenr = '¶'
let g:airline_symbols.linenr = 'L'
let g:airline_symbols.colnr = '㏇'
" let g:airline_section_c = ''
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.branch = '⎇ '
"
"
"
"
" 设置切换tab的快捷键 <Alt> + <i> 切换到第i个 tab
nmap <A-1> <Plug>AirlineSelectTab1
nmap <A-2> <Plug>AirlineSelectTab2
nmap <A-3> <Plug>AirlineSelectTab3
nmap <A-4> <Plug>AirlineSelectTab4
nmap <A-5> <Plug>AirlineSelectTab5
nmap <A-6> <Plug>AirlineSelectTab6
nmap <A-7> <Plug>AirlineSelectTab7
nmap <A-8> <Plug>AirlineSelectTab8
nmap <A-9> <Plug>AirlineSelectTab9
" close a TAB <Alt-q>
" 比<leader>q执行的快
nmap <A-q> :bp<cr>:bd #<cr>
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9
" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
nmap <leader>- <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
nmap <leader>+ <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap <leader>q :bp<cr>:bd #<cr>


" Coc configuration
" if hidden is not set, TextEdit might fail.
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=200

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


""""""""""""
"  hover   "
""""""""""""
" 使用 <C-w-w> 让光标在 hover 和 编辑窗口跳转，无需映射
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.5.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" book chapter 19
"
" --relativenumber
"
" set number
" set relativenumber
" augroup toggle_relative_number
"     autocmd InsertEnter * :setlocal norelativenumber
"     autocmd InsertLeave * :setlocal relativenumber
inoremap <C-l> <Del>
" not work
" inoremap <C-Del> <C-w>
