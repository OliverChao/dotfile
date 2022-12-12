require('impatient')
require('Oli.nvim-hlslens')
require('Oli.nvim-treesitter')
require('Oli.nvim-tree')
require('Oli.nvim-todo-comments')
require('Oli.nvim-hop')
require('Oli.nvim-bufferline')
require('Oli.nvim-lualine')
require('Oli.nvim-autopairs')
require('Oli.nvim-diffview')
require('Oli.nvim-gitsigns')
require('Oli.lsp')
require('Oli.nvim-mason')
require('Oli.nvim-cmp')
require('Oli.nvim-dap')
require('Oli.nvim-surround')
require('Oli.nvim-comment')
require('Oli.nvim-lspsaga')
require('Oli.nvim-telescope')
require('Oli.nvim-dressing')
require('Oli.nvim-indent-blankline')
--
--
require('Oli.nvim-ufo')
-- require('Oli.nvim-toggleterm')
-- require("Oli.nvim-trouble")


-- --------------------------------------
-- require('rust-tools').setup({})
-- --------------------------------------
require('neogen').setup({
    snippet_engine = "luasnip",
    enabled = true, --if you want to disable Neogen
    input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
})
-- --------------------------------------
-- beautify quickfix window 
vim.cmd([[
    hi BqfPreviewBorder guifg=#50a14f ctermfg=71
    hi link BqfPreviewRange Search
]])
require('bqf').setup({})

-- --------------------------------------
-- -- lua, default settings
-- require("better_escape").setup {
--     mapping = { "jk" }, -- a table with mappings to use
--     timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
--     clear_empty_lines = false, -- clear line after escaping if there is only whitespace
--     keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
--     -- example(recommended)
--     -- keys = function()
--     --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
--     -- end,
-- }
-- --------------------------------------
-- if vim.g.mkdp_filetypes ~= nil then
--     print("hello markdown")
--     require("nvim-picgo").setup()
-- end
-- --------------------------------------
