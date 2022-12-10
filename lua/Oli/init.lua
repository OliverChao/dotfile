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
-- require('Oli.nvim-ufo')
-- require('Oli.nvim-toggleterm')
-- require("Oli.nvim-lspsaga")
-- require("Oli.nvim-trouble")
--
-- ==============rust-tools===================
-- require('rust-tools').setup({})


-- ================neogen===================

require('neogen').setup({
    snippet_engine = "luasnip",
    enabled = true, --if you want to disable Neogen
    input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
})

-- 全都转到luasnip, 这个插件没必要使用了
-- -- =============snippet-converter==========
-- local template = {
--     -- name = "t1", (optionally give your template a name to refer to it in the `ConvertSnippets` command)
--     sources = {
--         ultisnips = {
--             -- Add snippets from (plugin) folders or individual files on your runtimepath...
--             "~/.config/nvim/UltiSnips",
--             -- ...or use absolute paths on your system.
--             -- vim.fn.stdpath("config") .. "/UltiSnips",
--         },
--     },
--     output = {
--         -- Specify the output formats and paths
--         vscode_luasnip = {
--             -- vim.fn.stdpath("config") .. "/luasnip_snippets",
--             "~/.config/nvim/luasnip"
--         },
--     },
-- }
-- require("snippet_converter").setup {
--     templates = { template },
--     -- To change the default settings (see configuration section in the documentation)
--     -- settings = {},
-- }

-- beautify quickfix window 
vim.cmd([[
    hi BqfPreviewBorder guifg=#50a14f ctermfg=71
    hi link BqfPreviewRange Search
]])
require('bqf').setup({})

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

-- picgo 
require("nvim-picgo").setup()


-- keymaps
require("Oli.keymaps")
