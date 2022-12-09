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

-- ### luasnip
-- 创建一条用户命令
vim.api.nvim_create_user_command("LuaSnipEdit", require("luasnip.loaders").edit_snippet_files, {})

-- # test
-- vim.keymap.set('n', 'lhs', "<cmd> lua print(\"hello\")<cr>")
