-- NOTE: new added keymaps should be put here if possible.
--
-- Basic Maps
-- quick command
vim.keymap.set({ 'v', 'n' }, ';', ':', {})
-- jump head / tail
vim.keymap.set('', '<leader>1', '^', {}) -- "+y
vim.keymap.set('', '<leader>2', '$', {}) -- "+y
--
vim.keymap.set('n', '<UP>', 'g<UP>', {})
vim.keymap.set('n', '<DOWN>', 'g<DOWN>', {})
-- clear heightlight
vim.keymap.set('n', '<C-l>', ':<C-u>nohlsearch<CR><C-l>', { silent = true })
--
vim.keymap.set('n', '<C-l>', ':<C-u>nohlsearch<CR><C-l>', { silent = true })
-- quickly copy / paste
vim.keymap.set('v', '<leader>y', '"+y', {}) -- "+y
vim.keymap.set('v', '<leader>d', '"+d', {})
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', {})
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+P', {})
-- move one byte in insert mode
vim.keymap.set('i', '<C-f>', '<Right>', {})
vim.keymap.set('i', '<C-b>', '<Left>', {})
-- quickfix window
vim.keymap.set('n', '<leader>cc', '<Cmd>cclose<CR>', { silent = true })
vim.keymap.set('n', '<leader>co', '<Cmd>copen<CR>', { silent = true })
-- pair with <C-h>
vim.keymap.set('i', '<C-l>', '<Del>', {})
-- windows quickly move
vim.keymap.set('n', '<A-h>', '<C-W>h', {})
vim.keymap.set('n', '<A-j>', '<C-W>j', {})
vim.keymap.set('n', '<A-k>', '<C-W>k', {})
vim.keymap.set('n', '<A-l>', '<C-W>l', {})
vim.keymap.set('n', '<A-c>', '<C-W>c', {})
vim.keymap.set('n', '<A-o>', '<C-W>o', {})
-- move lines
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi', {})
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi', {})
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", {})
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", {})
-- expand dir
vim.keymap.set('c', '%%', function()
    if vim.fn.getcmdtype() == ':' then
        return vim.fn.expand('%:h') .. "/"
    else
        return "%%"
    end
end, { expr = true })
-- Forbidden Mappings; set keyamp nop
vim.keymap.set('i', '<C-p>', '<nop>', {})
vim.keymap.set('i', '<C-n>', '<nop>', {})
vim.keymap.set('i', '<C-j>', '<nop>', {})
vim.keymap.set({ 'n', 'v' }, '<C-f>', '<nop>', {})
vim.keymap.set({ 'n', 'v', 'i' }, '<C-d>', '<nop>', {})
vim.keymap.set({ 'n', 'v' }, '<C-b>', '<nop>', {})
vim.keymap.set('i', '<C-k>', '<nop>', {})
vim.keymap.set('i', '<C-s>', '<nop>', {})
vim.keymap.set('i', '<C-v>', '<nop>', {})

vim.keymap.set('i', '<c-s-d>', '<nop>', {})
vim.keymap.set('i', '<c-s-s>', '<nop>', {})
vim.keymap.set('i', '<c-s-b>', '<nop>', {})

vim.keymap.set('i', '<c-s-k>', '<nop>', {})
vim.keymap.set('i', '<c-s-k>', '<nop>', {})

-- -- 禁用 o-select 模式下 跳转，很容易误触
-- vim.keymap.set('o', '<c-o>', '', {})
-- vim.keymap.set('o', '<c-i>', '', {})

-- INFO: ##### telescope
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
-- INFO: ## nvim-tree
vim.keymap.set('n', '<C-n>', function()
    if vim.bo.buftype == 'prompt' then
        return
    end
    require('nvim-tree.api').tree.toggle()
end)

-- INFO: ### tagbartoggle
vim.keymap.set('n', '<A-n>', "<cmd>TagbarToggle<CR>", { silent = true, noremap = true })
-- ### undotree
vim.keymap.set('n', '<F5>', "<cmd>UndotreeToggle<CR>", { silent = true, noremap = true })
--
-- INFO: ##### bufferline
vim.keymap.set('n', '<A-1>', function() require "bufferline".go_to_buffer(1) end, {})
vim.keymap.set('n', '<A-2>', function() require "bufferline".go_to_buffer(2) end, {})
vim.keymap.set('n', '<A-3>', function() require "bufferline".go_to_buffer(3) end, {})
vim.keymap.set('n', '<A-4>', function() require "bufferline".go_to_buffer(4) end, {})
vim.keymap.set('n', '<A-5>', function() require "bufferline".go_to_buffer(5) end, {})
vim.keymap.set('n', '<A-6>', function() require "bufferline".go_to_buffer(6) end, {})
vim.keymap.set('n', '<A-7>', function() require "bufferline".go_to_buffer(7) end, {})
vim.keymap.set('n', '<A-8>', function() require "bufferline".go_to_buffer(8) end, {})
vim.keymap.set('n', '<A-9>', function() require "bufferline".go_to_buffer(9) end, {})
vim.keymap.set('n', '<A-p>', '<Cmd>BufferLinePick<CR>', { silent = true })
vim.keymap.set('n', '<A-q>', '<Cmd>bp<cr>:bd #<cr>', {})
--
