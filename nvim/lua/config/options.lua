--  ╭────────────────────────────────────────────────╮
--  │                  Nvim Options                  │
--  ╰────────────────────────────────────────────────╯
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


if vim.fn.has("g:neovide") then
    vim.keymap.set('i', '<c-space>', '', {})
    vim.g.neovide_scale_factor = 1.0
    vim.g.neovide_remember_window_size = true

    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_no_idle = true
    vim.g.neovide_hide_mouse_when_typing = true
end


--  ╭────────────────────────────────────────────────╮
--  │              Some Plugins Option               │
--  ╰────────────────────────────────────────────────╯

vim.cmd([[
" let g:VM_mouse_mappings = 1
let g:VM_theme = 'ocean'
let g:VM_highlight_matches = 'underline'

let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<A-f>'           
let g:VM_maps['Find Subword Under'] = '<A-f>'           
" let g:VM_maps['Select All']         = '<A-a>'
let g:VM_maps['Select h']           = '<A-Left>'
let g:VM_maps['Select l']           = '<A-Right>'
let g:VM_maps['Add Cursor Up']      = '<A-e>'
let g:VM_maps['Add Cursor Down']    = '<A-d>'
let g:VM_maps['Add Cursor At Pos']  = '<A-z>'
" let g:VM_maps['Add Cursor At Word'] = '<A-g>'
let g:VM_maps['Remove Region']      = 'q'
]])
--
--
-- barbaric
vim.g.barbaric_ime = 'fcitx'
vim.g.barbaric_scope = 'buffer'
vim.g.barbaric_timeout = -1
vim.g.barbaric_fcitx_cmd = 'fcitx5-remote'


-- vim-floaterm
vim.g.floaterm_keymap_toggle = '<Leader>t'
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9
