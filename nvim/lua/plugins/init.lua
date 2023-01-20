require('impatient')
require('plugins.nvim-hlslens')
require('plugins.nvim-treesitter')
require('plugins.nvim-tree')
require('plugins.nvim-todo-comments')
require('plugins.nvim-hop')
require('plugins.nvim-bufferline')
require('plugins.nvim-lualine')
require('plugins.nvim-autopairs')
require('plugins.nvim-diffview')
require('plugins.nvim-gitsigns')
require('plugins.lsp')
require('plugins.nvim-mason')
require('plugins.nvim-cmp')
require('plugins.nvim-dap')
require('plugins.nvim-surround')
require('plugins.nvim-comment')
-- require('plugins.nvim-lspsaga')
require('plugins.nvim-telescope')
require('plugins.nvim-dressing')
require('plugins.nvim-indent-blankline')
--
--
require('plugins.nvim-ufo')
-- require('plugins.nvim-murmur')

-- require('plugins.nvim-rust')
-- require('plugins.nvim-toggleterm')
-- require("plugins.nvim-trouble")


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

-- ---------------------------------------
-- show cursor word
require('nvim-cursorline').setup {
    cursorline = {
        enable = false,
        timeout = 1000,
        number = false,
    },
    cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
    }
}
-- --------------------------------------
-- show color
require 'colorizer'.setup()
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
