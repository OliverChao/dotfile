require("nvim-surround").setup({
  -- Configuration here, or leave empty to use defaults
  keymaps = {
    insert = "<C-g>s",
    insert_line = "<C-g>S",
    normal = "ys",
    normal_cur = "yss",
    normal_line = "yS",
    normal_cur_line = "ySS",
    visual = "S",
    visual_line = "gS",
    delete = "ds",
    change = "cs",
  },
})
-- require("nvim-surround").setup({
--     keymaps = {
--         normal = "ys",
--         visual = "S",
--         delete = "ds",
--         change = "cs",
--     },
--     surrounds = {
--         pairs = {
--             [")"] = { "( ", " )" },
--             ["("] = { "(", ")" },
--             ["}"] = { "{ ", " }" },
--             ["{"] = { "{", "}" },
--             [">"] = { "< ", " >" },
--             ["<"] = { "<", ">" },
--             ["]"] = { "[ ", " ]" },
--             ["["] = { "[", "]" },
--             ["*"] = { "**", "**" },
--         },
--         separators = {
--             ["'"] = { "'", "'" },
--             ['"'] = { '"', '"' },
--             ["`"] = { "`", "`" },
--         },
--         HTML = {
--             ["t"] = false, -- Use "t" for HTML-style mappings
--         },
--         aliases = {
--             ["a"] = ">", -- Single character aliases apply everywhere
--             ["b"] = ")",
--             ["B"] = "}",
--             ["r"] = "]",
--             ["q"] = { '"', "'", "`" }, -- Table aliases only apply for changes/deletions
--             ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
--         },
--     }
-- })
