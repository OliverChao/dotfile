require('Comment').setup(
    {
        ---Add a space b/w comment and the line
        padding = true,
        ---Whether the cursor should stay at its position
        sticky = true,
        ---Lines to be ignored while (un)comment
        ignore = nil,
        ---LHS of toggle mappings in NORMAL mode
        toggler = {
            ---Line-comment toggle keymap
            -- line = 'gcc',
            line = '<leader>c<space>',
            ---Block-comment toggle keymap
            -- block = 'gbc',
        },
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
            ---Line-comment keymap
            -- line = 'gc',
            line = '<leader>c<space>',
            ---Block-comment keymap
            -- block = 'gb',
        },
        ---LHS of extra mappings
        extra = {
            ---Add comment on the line above
            above = 'gcO',
            ---Add comment on the line below
            below = 'gco',
            ---Add comment at the end of line
            eol = 'gcA',
        },
        ---Enable keybindings
        ---NOTE: If given `false` then the plugin won't create any mappings
        mappings = {
            ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
            basic = true,
            ---Extra mapping; `gco`, `gcO`, `gcA`
            extra = false,
        },
        ---Function to call before (un)comment
        pre_hook = nil,
        ---Function to call after (un)comment
        post_hook = nil,
    }
)

---Operator function to invert comments on each line
-- see: https://github.com/numToStr/Comment.nvim/issues/17#issuecomment-1148592727
function _G.__flip_flop_comment()
    local U = require("Comment.utils")
    local s = vim.api.nvim_buf_get_mark(0, "[")
    local e = vim.api.nvim_buf_get_mark(0, "]")
    local range = { srow = s[1], scol = s[2], erow = e[1], ecol = e[2] }
    local ctx = {
        ctype = U.ctype.linewise,
        range = range,
    }
    local cstr = require("Comment.ft").calculate(ctx) or vim.bo.commentstring
    local ll, rr = U.unwrap_cstr(cstr)
    local padding = true
    local is_commented = U.is_commented(ll, rr, padding)

    local rcom = {} -- ranges of commented lines
    local cl = s[1] -- current line
    local rs, re = nil, nil -- range start and end
    local lines = U.get_lines(range)
    for _, line in ipairs(lines) do
        if #line == 0 or not is_commented(line) then -- empty or uncommented line
            if rs ~= nil then
                table.insert(rcom, { rs, re })
                rs, re = nil, nil
            end
        else
            rs = rs or cl -- set range start if not set
            re = cl -- update range end
        end
        cl = cl + 1
    end
    if rs ~= nil then
        table.insert(rcom, { rs, re })
    end

    local cursor_position = vim.api.nvim_win_get_cursor(0)
    local vmark_start = vim.api.nvim_buf_get_mark(0, "<")
    local vmark_end = vim.api.nvim_buf_get_mark(0, ">")

    ---Toggle comments on a range of lines
    ---@param sl integer: starting line
    ---@param el integer: ending line
    local toggle_lines = function(sl, el)
        vim.api.nvim_win_set_cursor(0, { sl, 0 }) -- idk why it's needed to prevent one-line ranges from being substituted with line under cursor
        vim.api.nvim_buf_set_mark(0, "[", sl, 0, {})
        vim.api.nvim_buf_set_mark(0, "]", el, 0, {})
        require("Comment.api").locked("toggle.linewise")("")
    end

    toggle_lines(s[1], e[1])
    for _, r in ipairs(rcom) do
        toggle_lines(r[1], r[2]) -- uncomment lines twice to remove previous comment
        toggle_lines(r[1], r[2])
    end

    vim.api.nvim_win_set_cursor(0, cursor_position)
    vim.api.nvim_buf_set_mark(0, "<", vmark_start[1], vmark_start[2], {})
    vim.api.nvim_buf_set_mark(0, ">", vmark_end[1], vmark_end[2], {})
    vim.o.operatorfunc = "v:lua.__flip_flop_comment" -- make it dot-repeatable
end

-- Invert (flip flop) comments with gC, in normal and visual mode
vim.keymap.set(
    { "n", "x" },
    "<leader>ci",
    "<cmd>set operatorfunc=v:lua.__flip_flop_comment<cr>g@",
    { silent = true, desc = "Invert comments" }
)
