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
