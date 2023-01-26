local M = {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    -- priority = 1,
    -- commit = "db7cbcb",
    --
    event = "BufReadPre",
}

function M.config()

    local ok, indent = pcall(require, "indent_blankline")

    if not ok then
        return
    end

    -- 自己不喜欢显示 空格 和 回车, 减少视觉压力
    -- 并且不喜欢 显示 第一个 indentation
    -- vim.opt.list = true
    -- vim.opt.listchars:append "space:⋅"
    -- vim.opt.listchars:append "eol:⤸"
    -- vim.g.indent_blankline_context_char = '¦'
    indent.setup {
        char = "¦",
        -- char = "┊",
        -- char = "│",
        context_char = "¦",
        space_char_blankline = " ",
        show_first_indent_level = false,
        filetype_exclude = {
            "startify",
            "dashboard",
            "dotooagenda",
            "log",
            "fugitive",
            "gitcommit",
            "packer",
            "vimwiki",
            -- "markdown",
            "json",
            "txt",
            "vista",
            "help",
            "todoist",
            "NvimTree",
            "peekaboo",
            "git",
            "TelescopePrompt",
            "undotree",
            "flutterToolsOutline",
            "", -- for all buffers without a file type
        },
        buftype_exclude = { "terminal", "nofile" },
        show_trailing_blankline_indent = true,
        show_current_context = true,
        show_current_context_start = false,
        context_patterns = {
            "class",
            "function",
            "method",
            "block",
            "list_literal",
            "selector",
            "^if",
            "^table",
            "if_statement",
            "while",
            "for",
        },
    }
end

return M
