-- theme
vim.o.termguicolors = true
vim.o.background = "dark"

vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
vim.g.gruvbox_material_sign_column_background = 'none'

vim.cmd([[ 
colorscheme gruvbox-material 
" 颜色方案, 参考 AGou 方案
hi Comment cterm=NONE ctermfg=245 gui=NONE guifg=#928374
hi GitSignsCurrentLineBlame ctermfg=245 gui=italic guifg=#928374

" 如果喜欢可以吧 一些特殊关键字 设为斜体
" hi TSKeyword ctermfg=167 gui=italic guifg=#ea6962
" hi TSKeywordFunction ctermfg=167 gui=italic guifg=#ea6962
" hi TSConditional ctermfg=167 gui=italic guifg=#ea6962
hi TSKeyword ctermfg=167 guifg=#ea6962
hi TSKeywordFunction ctermfg=167 guifg=#ea6962
hi TSConditional ctermfg=167 guifg=#ea6962
hi TreesitterContext ctermfg=223 ctermbg=237 guifg=#ddc7a1 guibg=#3c3836
hi NormalFloat ctermfg=223 ctermbg=237 guifg=#ddc7a1 guibg=#1E2021
hi FloatBorder  ctermfg=142 guifg=#a9b665 guibg=#1E2021
" hi InclineNormal ctermfg=223 ctermbg=237 gui=italic guifg=#ddc7a1 guibg=#3c3836
hi lualine_c_inactive ctermfg=223 ctermbg=237 gui=italic guifg=#ddc7a1 guibg=#3c3836
]])


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
-- use nvim-cursorline instead
-- vim.g.cursorword_delay = 0

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

vim.g.mkdp_auto_close = 0
vim.g.madp_theme = 'dark'
vim.cmd([[
aug VMlens
	au!
	au User visual_multi_start lua require('Oli.nvim-vmlens').start()
	au User visual_multi_exit lua require('Oli.nvim-vmlens').exit()
aug END
]])
