-- theme
vim.o.termguicolors = true
vim.o.background = "dark"

vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
vim.g.gruvbox_material_sign_column_background = 'none'

vim.cmd([[ colorscheme gruvbox-material ]])


-- AsyncRun
--
vim.g.asyncrun_open = 6
vim.g.asyncrun_stdin = 1

-- " ========= vim-visual-multi settings ==========
vim.cmd([[
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<F2>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<F2>'           " replace visual C-n
]])
vim.g.VM_mouse_mappings = 1
vim.g.VM_highlight_matches = 'underline'
vim.g.VM_theme = 'iceblue'
vim.keymap.set('n', '<CR>', '<CR>', {})

-- neoformater
vim.cmd([[
augroup fmt
  autocmd!
  autocmd BufWritePre *.go Neoformat goimports | Neoformat gofumpt
  autocmd BufWritePre *.rs Neoformat rustfmt
  autocmd BufWritePre *.cpp Neoformat clangformat 
  autocmd BufWritePre *.sh Neoformat
augroup END
]])
vim.g.neoformat_only_msg_on_error = 1
vim.g.neoformat_cpp_clangformat = {
    exe = 'clang-format',
    args = { '-style=llvm' }
    -- args = { '-style=microsoft' }
}
--
--
-- nvim-cmp
vim.o.completeopt = 'menuone,noinsert,noselect'
-- Avoid showing extra messages when using completion
vim.opt.shortmess:append('c')

-- barbaric 
vim.g.barbaric_ime = 'fcitx'
vim.g.barbaric_scope = 'buffer'
vim.g.barbaric_timeout = -1
vim.g.barbaric_fcitx_cmd = 'fcitx5-remote'

-- vim-cursor
vim.g.cursorword_delay = 0

-- vim-floaterm
vim.g.floaterm_keymap_toggle = '<Leader>t'
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9

-- vimtex
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_syntax_conceal_disable = 1

-- undotree
vim.g.undotree_WindowLayout = 3

-- tagbar
vim.g.tagbar_width = 30
vim.cmd([[
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
]])

-- vim-markdown & markdown-preview
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_conceal = 0
vim.g.tex_conceal = ""
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_conceal_code_blocks = 0

vim.cmd([[
aug VMlens
	au!
	au User visual_multi_start lua require('Oli.nvim-vmlens').start()
	au User visual_multi_exit lua require('Oli.nvim-vmlens').exit()
aug END
]])
