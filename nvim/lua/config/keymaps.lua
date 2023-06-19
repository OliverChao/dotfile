-- NOTE: new added keymaps should be put here if possible.
--
--  ╭────────────────────────────────────────────────╮
--  │                 Basic Mappings                 │
--  ╰────────────────────────────────────────────────╯
-- another choice to esc
vim.keymap.set("i", "<C-]>", "<ESC>")
-- quick command
vim.keymap.set({ "x", "n" }, ";", ":")
-- jump head / tail
vim.keymap.set({ "n", "x" }, "<leader>1", "g^")
vim.keymap.set({ "n", "x" }, "<leader>2", "g$")
--
-- vim.keymap.set("n", "<UP>", "g<UP>")
-- vim.keymap.set("n", "<DOWN>", "g<DOWN>")
vim.keymap.set({ "n", "x" }, "j", "gj")
vim.keymap.set({ "n", "x" }, "k", "gk")

-- using <TAB> as quickly pair-mapping
-- vim.keymap.set({ "n", "v" }, "<Tab>", "%")
--
-- quickly copy / paste
vim.keymap.set("x", "<leader>y", '"+y') -- "+y
vim.keymap.set("x", "<leader>d", '"+d')
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p')
vim.keymap.set({ "n", "x" }, "<leader>P", '"+P')
-- move one byte in insert mode
vim.keymap.set("c", "<A-f>", "<C-f>", { noremap = false })
vim.keymap.set("c", "<C-a>", "<C-b>", { noremap = false })
vim.keymap.set({ "i", "c" }, "<C-f>", "<Right>")
vim.keymap.set({ "i", "c" }, "<C-b>", "<Left>")
-- quickfix window
vim.keymap.set("n", "<leader>cc", "<Cmd>cclose<CR>", { silent = true })
vim.keymap.set("n", "<leader>co", "<Cmd>copen<CR>", { silent = true })
-- pair with <C-h>
vim.keymap.set({ "i", "c" }, "<C-l>", "<Del>")
-- windows quickly move
vim.keymap.set("n", "<A-h>", "<C-W>h")
vim.keymap.set("n", "<A-j>", "<C-W>j")
vim.keymap.set("n", "<A-k>", "<C-W>k")
vim.keymap.set("n", "<A-l>", "<C-W>l")
vim.keymap.set("n", "<A-c>", "<C-W>c")
vim.keymap.set("n", "<A-o>", "<C-W>o")
-- move lines
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- expand dir
vim.keymap.set("c", "%%", function()
  if vim.fn.getcmdtype() == ":" then
    return vim.fn.expand("%:h") .. "/"
  else
    return "%%"
  end
end, { expr = true })
-- Forbidden Mappings; set keyamp nop
vim.keymap.set("i", "<C-p>", "<nop>")
vim.keymap.set("i", "<C-n>", "<nop>")
vim.keymap.set("i", "<C-s-n>", "<nop>")
vim.keymap.set("i", "<C-s-p>", "<nop>")

vim.keymap.set("i", "<C-j>", "<nop>")
vim.keymap.set({ "v" }, "<C-f>", "<nop>")
vim.keymap.set({ "v", "i" }, "<C-d>", "<nop>")
vim.keymap.set({ "n", "v" }, "<C-b>", "<nop>")
vim.keymap.set("i", "<C-k>", "<nop>")
vim.keymap.set("i", "<C-s>", "<nop>")

-- WARN: 注意在 neovide 解决mac映射后可以取消
if not vim.g.neovide then
  vim.keymap.set("i", "<C-v>", "<nop>")
end
vim.keymap.set("i", "<C-z>", "<nop>")
vim.keymap.set("i", "<C-q>", "<nop>")

vim.keymap.set("i", "<c-s-d>", "<nop>")
vim.keymap.set("i", "<c-s-s>", "<nop>")
vim.keymap.set("i", "<c-s-b>", "<nop>")

vim.keymap.set("i", "<c-s-k>", "<nop>")
vim.keymap.set("i", "<c-s-k>", "<nop>")

vim.keymap.set("i", "<C-g>", "<nop>")
vim.keymap.set("i", "<C-s-g>", "<nop>")

-- -- 禁用 o-select 模式下 跳转，很容易误触
-- vim.keymap.set('o', '<c-o>', '')
-- vim.keymap.set('o', '<c-i>', '')

-- vim.keymap.set("c", "<C-b>", "<left>")
--  ╭────────────────────────────────────────────────╮
--  │              Some Plugin Mappings              │
--  ╰────────────────────────────────────────────────╯
--  plugin mappings are all configured in their own config fucntion
