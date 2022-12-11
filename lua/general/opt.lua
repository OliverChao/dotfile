-- INFO: filetype and syntax (and several) are enabled by default in nvim.
--" see: https://neovim.io/doc/user/vim_diff.html#nvim-defaults

vim.g.mapleader = ','

vim.o.compatible = false
vim.o.autoindent = true
vim.o.autowrite = true
vim.o.ruler = true
vim.o.smartindent = true
vim.o.lazyredraw = true
vim.o.number = true

vim.o.cmdheight = 1
vim.o.report = 0
vim.o.relativenumber = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes:1'
vim.o.hlsearch = true

vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.expandtab = true

vim.cmd([[
autocmd FileType php,ruby,yaml set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType c,cpp set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType go set noexpandtab tabstop=4 shiftwidth=4
autocmd FileType coffee,javascript set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html,html,django,xhtml,haml set tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css set tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
]])

vim.o.mouse = 'nvi'
vim.o.mousehide = true
vim.o.splitright = true

vim.o.updatetime = 500

vim.o.backup = false
vim.o.swapfile = false
vim.o.writebackup = false

vim.cmd([[
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
]])
--
vim.o.fileencoding = 'uft-8'
vim.o.termencoding = 'uft-8'
vim.o.encoding = 'utf-8'


vim.o.foldmethod = 'indent'
vim.o.foldnestmax = 3
vim.o.foldenable = false
vim.o.foldlevel = 100

vim.o.guifont = 'JetBrainsMonoNL Nerd Font Mono:h12'

