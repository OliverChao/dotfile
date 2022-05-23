
""""""""""""""""""""""""""""
"  vim-go configuration    "
""""""""""""""""""""""""""""
 " 禁用vim-go自动加载的ultisnips,
 " 否则不能使用自己定义的ultisnips
let g:go_loaded_gosnippets = 0

" forbid the go_doc_keywordprg in vim.go 
" or the hover will never work by Coc
let g:go_doc_keywordprg_enabled=0

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
"
"
"
"

""""""""""""""""""""""""
"  rust configuration  "
""""""""""""""""""""""""
" enable automatic running of :RustFmt when you save a buffer.
let g:rustfmt_autosave = 1
autocmd FileType rust noremap <silent><leader>r :Cargo run<CR>
autocmd FileType rust noremap <silent><leader>f :RustFmt<CR>
" similar as golang, <nowait> will coc-rename unwork.
" autocmd FileType rust noremap <silent><nowait><leader>r :RustRun<CR>
" autocmd FileType rust noremap <silent><nowait><leader>f :RustFmt<CR>
