map <Leader>1 ^
map <Leader>2 $
" 括号匹配
" 弃用, 因为有了coc-pairs 插件
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap ' ''<ESC>i
" inoremap " ""<ESC>i

" ================ C-L highlight ============
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
"===================C-L END=======================
"
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



"========================plugins mappings==================
"
