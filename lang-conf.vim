""""""""""""""""""""""""""""
"  vim-go configuration    "
""""""""""""""""""""""""""""
" 11-21 give up vim-go
"  " 禁用vim-go自动加载的ultisnips,
"  " 否则不能使用自己定义的ultisnips
" let g:go_loaded_gosnippets = 0
"
" let g:go_fmt_command = "goimports"
" let g:go_highlight_functions = 1
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_function_calls = 1
"
" let g:go_auto_type_info=1
"
" let g:go_list_type = "quickfix"
set updatetime=100
" go-vim map configuration. 
" autocmd FileType go nmap <leader>b <Plug>(go-build)
" autocmd FileType go nmap <leader>r <Plug>(go-run)
" autocmd FileType go nmap <leader>f <Plug>(go-fmt)
" autocmd FileType go nmap <silent><leader>b  <Plug>(go-build)
" autocmd FileType go nmap <silent><leader>r  <Plug>(go-run)
" autocmd FileType go nmap <silent><leader>f  <Plug>(go-fmt)
" NOTE: using AsyncRun
autocmd FileType go noremap <leader>ra :AsyncRun go run $(VIM_FILEPATH)<CR>
" autocmd FileType go noremap <leader>rs :AsyncRun -mode=term -pos=bottom -rows=8 go run $(VIM_FILEPATH)<CR>
autocmd FileType go noremap <leader>rt :AsyncRun -mode=term -pos=floaterm go run $(VIM_FILEPATH)<CR>



""""""""""""""""""""""""
"  rust configuration  "
""""""""""""""""""""""""
" enable automatic running of :RustFmt when you save a buffer.
" let g:rustfmt_autosave = 1
" let g:rust_clip_command = 'xclip -selection clipboard'
" let g:rustfmt_fail_silently = 1
" autocmd FileType rust noremap <silent><nowait><leader>r :RustRun<CR>
" autocmd FileType rust noremap <silent><nowait><leader>f :RustFmt<CR>
" autocmd FileType rust noremap <silent><leader>r :Cargo run<CR>
autocmd FileType rust noremap <leader>ra :AsyncRun cargo run<CR>
" autocmd FileType rust noremap <leader>rs :AsyncRun -mode=term -pos=bottom cargo run<CR>
autocmd FileType rust noremap <leader>rt :AsyncRun -mode=term -pos=floaterm cargo run<CR>


"""""""""""""
"  markdown "
"""""""""""""
" picgo; only for markdown file
" autocmd FileType markdown lua require("nvim-picgo").setup()
autocmd FileType markdown noremap <leader>mu :UploadClipboard<CR>

