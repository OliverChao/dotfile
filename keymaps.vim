map <Leader>1 ^
map <Leader>2 $
" 括号匹配
" 弃用, 因为有了coc-pairs 插件
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap ' ''<ESC>i
" inoremap " ""<ESC>i
nnoremap <UP> g<UP>
nnoremap <DOWN> g<DOWN>
" ================ C-L highlight ============
noremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" '*' will search the selected text in visual mode
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
"
" replace vim's built-in visual * and # behavior
xnoremap * :<C-u>call VisualStarSearchSet('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call VisualStarSearchSet('?')<CR>?<C-R>=@/<CR><CR>

" %% in command mode will auto expand to current direction
cnoremap <expr> %% getcmdtype()==':'?expand('%:h').'/' : '%%'
" ==================== '*' command end =====================
"
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
" quickly move for windows
nnoremap <A-h> <C-W>h
nnoremap <A-j> <C-W>j
nnoremap <A-k> <C-W>k
nnoremap <A-l> <C-W>l
nnoremap <A-c> <C-W>c
" inoremap <S-w> <Esc><S-o>
" Press i to enter insert mode, and ii to exit insert mode.
" :inoremap ii <Esc>
"
"
" forbid some insert mode mappings
inoremap <c-p> <nop>
inoremap <c-n> <nop>
inoremap <c-j> <nop>
" inoremap <c-k> <nop>
"
" pair with C-h
inoremap <C-l> <Del>
"
" 避免手残输错
command! -nargs=0 W :w 
command! -nargs=0 Q :q 
" command W w
command WQ wq
command Wq wq
command Wa wa
command Qa qa
" 把:W 映射为:w; 因为很容易触发:W
"
"
inoremap <C-f> <Right>
" I don know, but it make ultisnip error-prone
" inoremap <C-j> <Right>
inoremap <C-b> <Left>
"========================plugins mappings==================
" NOTE: many mappings are in ./lua <23-05-22, Oliver> "
"
""""""""""""""""""
"  dap mappings  "
""""""""""""""""""
nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <F4> <Cmd>lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
" nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
" nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
""""""""""""""""""""""
"  dap mappings end  "
""""""""""""""""""""""

"==================bar & tree settings=======================
" quickly open TagbarToggle
nnoremap <A-n> :TagbarToggle<CR>
nnoremap <C-n> :NvimTreeToggle<CR>
" conflict with my vim-go plugin and create new file
" nnoremap <leader>r :NvimTreeRefresh<CR>
" nnoremap <leader>n :NvimTreeFindFile<CR>
"
" nnoremap <F5> :UndotreeToggle<CR>
nnoremap <leader>h :UndotreeToggle <bar> :UndotreeFocus<CR>
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
" close a tag quickly
nmap <A-q> :bp<cr>:bd #<cr>

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
"
"
"
"======================fzf==========================
noremap <leader>ff :<C-u>Files<CR>
" noremap <leader>fm :<C-u>Marks<CR>
" noremap <leader>fr :<C-u>Rg<CR>
noremap <leader>fl :<C-u>Lines<CR>
noremap <leader>b :<C-u>Buffers<CR>
" noremap <leader>b :<C-u>Lines<CR>
"
"
" ===================Coc&Extensions===============
"
" NOTE: Use markdown-preview.nvim; forgive coc-markdown <26-05-22, Oliver> "
"=Coc-markdown configuration=
" nnoremap <silent><nowait> <space>m :<C-u>CocCommand markdown-preview-enhanced.openPreview<CR>
