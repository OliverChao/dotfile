-- tabwidth
vim.cmd([[
autocmd FileType php,ruby,yaml set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType c,cpp set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType lua set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType go set noexpandtab tabstop=4 shiftwidth=4
autocmd FileType coffee,javascript set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html,html,django,xhtml,haml set tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css set tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
]])
