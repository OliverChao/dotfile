" DONE: in lua
" map <Leader>1 ^
" map <Leader>2 $
" nnoremap <UP> g<UP>
" nnoremap <DOWN> g<DOWN>
"
"
"
" NOTE: 这段代码没有转到lua,
" 但是 nvim 可以实现光标下搜索
" 所以没有必要映射到 keymap.lua
"
" ================ C-L highlight ============
" noremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" '*' will search the selected text in visual mode
" function! VisualStarSearchSet(cmdtype,...)
"   let temp = @"
"   normal! gvy
"   if !a:0 || a:1 != 'raw'
" 	let @" = escape(@", a:cmdtype.'\*')
"   endif
"   let @/ = substitute(@", '\n', '\\n', 'g')
"   let @/ = substitute(@/, '\[', '\\[', 'g')
"   let @/ = substitute(@/, '\~', '\\~', 'g')
"   let @/ = substitute(@/, '\.', '\\.', 'g')
"   let @" = temp
" endfunction
"
" replace vim's built-in visual * and # behavior
" xnoremap * :<C-u>call VisualStarSearchSet('/')<CR>/<C-R>=@/<CR><CR>
" xnoremap # :<C-u>call VisualStarSearchSet('?')<CR>?<C-R>=@/<CR><CR>
"
"

" DONE: in lua
" %% in command mode will auto expand to current direction
" cnoremap <expr> %% getcmdtype()==':'?expand('%:h').'/' : '%%'
" ==================== '*' command end =====================
"
" DONE: in lua
" move line or visually selected block - alt+j/k
" == will make a line indented
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
" gv in normal mode will re-select the previous visual selection.
" = will make selected lines indented
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv
" in insertion mode; ctrl-k to delete a line
" inoremap <C-K>  <Esc>ddO
"
" DONE: in lua
" quickly move for windows
" nnoremap <A-h> <C-W>h
" nnoremap <A-j> <C-W>j
" nnoremap <A-k> <C-W>k
" nnoremap <A-l> <C-W>l
" nnoremap <A-c> <C-W>c
" nnoremap <A-o> <C-W>o
" inoremap <S-w> <Esc><S-o>
" Press i to enter insert mode, and ii to exit insert mode.
" :inoremap ii <Esc>
"
"
" DONE: in lua
"""""""""""""""""""""""""
"  Forbidding mappings  "
"""""""""""""""""""""""""
" 禁用一些没有用的快捷键，防止误触
" forbid some insert mode mappings
" inoremap <c-p> <nop>
" inoremap <c-n> <nop>
" inoremap <c-j> <nop>
" inoremap <c-i> <nop>
" inoremap <c-k> <nop>

" nnoremap <c-f> <nop>
" nnoremap <c-d> <nop>
" nnoremap <c-b> <nop>
" vnoremap <c-b> <nop>
" vnoremap <c-f> <nop>
" vnoremap <c-d> <nop>

" inoremap <c-d> <nop>
" inoremap <c-k> <nop>
" inoremap <c-s> <nop>
" inoremap <c-s-d> <nop>
" inoremap <c-s-f> <nop>
" inoremap <c-s-b> <nop>
" inoremap <c-s-s> <nop>
" inoremap <c-s-k> <nop>
"
"
"""""""""""""""""""""
"  Forbidding DONE  "
"""""""""""""""""""""

" DONE: in lua
" " pair with C-h
" inoremap <C-l> <Del>
"

" DONE: in lua
" 避免手残输错
" command! -nargs=0 W :w 
" command! -nargs=0 Q :q 
" command W w
" command WQ wq
" command Wq wq
" command Wa wa
" command Qa qa
" 把:W 映射为:w; 因为很容易触发:W
"
" DONE: in lua
" quickly copy&paste within system copyboard
" vmap <Leader>y "+y
" vmap <Leader>d "+d
" nmap <Leader>p "+p
" nmap <Leader>P "+P
" vmap <Leader>p "+p
" vmap <Leader>P "+P
"
" DONE: in lua
" inoremap <C-f> <Right>
" " I don know, but it make ultisnip error-prone
" " inoremap <C-j> <Right>
" inoremap <C-b> <Left>


" =============== quickfix window ==============
" noremap <silent> <leader>cc :cclose<CR>
" noremap <silent> <leader>co :copen<CR>
"
"=====================[[ plugins ]] mappings==================
" DONE: all in lua
" NOTE: 一些快捷键会在配置 lua 文件时直接指定.
" 插件的 keymaps 应该写在 ./lua/Oli/keymap.lua 文件中
"
""""""""""""""""""
"  dap mappings  "
""""""""""""""""""
" nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
" nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
" nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
" nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
" nnoremap <silent> <F4> <Cmd>lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
" nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
" nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
""""""""""""""""""""""
"  dap mappings end  "
""""""""""""""""""""""

" nmap <A-1> <Cmd>BufferLineGoToBuffer 1<CR>
" nmap <A-2> <Cmd>BufferLineGoToBuffer 2<CR>
" nmap <A-3> <Cmd>BufferLineGoToBuffer 3<CR>
" nmap <A-4> <Cmd>BufferLineGoToBuffer 4<CR>
" nmap <A-5> <Cmd>BufferLineGoToBuffer 5<CR>
" nmap <A-6> <Cmd>BufferLineGoToBuffer 6<CR>
" nmap <A-7> <Cmd>BufferLineGoToBuffer 7<CR>
" nmap <A-8> <Cmd>BufferLineGoToBuffer 8<CR>
" nmap <A-9> <Cmd>BufferLineGoToBuffer 9<CR>
" nmap <A-p> <Cmd>BufferLinePick<CR>
" " close a tab quickly
" nmap <A-q> :bp<cr>:bd #<cr>

"======================fzf==========================
" noremap <leader>ff :<C-u>Files<CR>
" noremap <leader>fm :<C-u>Marks<CR>
" noremap <leader>fr :<C-u>Rg<CR>
" noremap <leader>fl :<C-u>Lines<CR>
" noremap <leader>b :<C-u>Buffers<CR>
" noremap <leader>b :<C-u>Lines<CR>
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-l> <plug>(fzf-complete-buffer-line)

