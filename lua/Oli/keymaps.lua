-- NOTE: 新加的快捷键配置, 能lua则lua
--
-- ##### telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fl', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope grep_string search=<cr>', {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>fm', builtin.marks, {})
vim.keymap.set('n', '<leader>fr', builtin.registers, {})
vim.keymap.set("n", "<leader>fh", require('telescope').extensions.find_pickers.find_pickers)
--
--
-- ## nvim-tree
vim.keymap.set('n', '<C-n>', function()
    if vim.bo.buftype == 'prompt' then
        return
    end
    require('nvim-tree.api').tree.toggle()
end)

-- ### tagbartoggle
-- keymap.set 可以不设置 noremap, 默认是true
vim.keymap.set('n', '<A-n>', "<cmd>TagbarToggle<CR>", { silent = true, noremap = true })
-- ### undotree
vim.keymap.set('n', '<F5>', "<cmd>UndotreeToggle<CR>", { silent = true, noremap = true })
-- ### NERDCommenter
-- noremap <leader>c<space> <plug>NERDCommenterToggle
-- noremap <leader>ci <plug>NERDCommenterInvert
vim.keymap.set({ 'n', 'v' }, '<leader>c<space>', "<plug>NERDCommenterToggle", { noremap = true })
vim.keymap.set({ 'n', 'v' }, '<leader>ci', "<plug>NERDCommenterInvert", { noremap = true })

-- ##### luasnip
-- 创建一条用户命令
vim.api.nvim_create_user_command("LuaSnipEdit", require("luasnip.loaders").edit_snippet_files, { nargs = 0 })

-- # test
-- vim.keymap.set('n', 'lhs', "<cmd> lua print(\"hello\")<cr>")
-- vim.keymap.set('n', 'lhs', function()
--     vim.cmd([[TagbarToggle]])
-- end)
