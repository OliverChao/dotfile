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
" hi InclineNormal ctermfg=223 ctermbg=237 gui=italic guifg=#ddc7a1 guibg=#3c3836
hi lualine_c_inactive ctermfg=223 ctermbg=237 gui=italic guifg=#ddc7a1 guibg=#3c3836
hi Pmenu ctermfg=223 ctermbg=237 guifg=#ddc7a1 guibg=#1E2021
" lsp hover cololrscheme
hi FloatBorder  ctermfg=142 guifg=#a9b665 guibg=#1E2021
hi NormalFloat ctermfg=223 ctermbg=237 guifg=#ddc7a1 guibg=#1E2021
]])

-- vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
-- vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

-- go tree-sitter highlight
vim.cmd([[
autocmd FileType go hi @type.definition ctermfg=1
]])
