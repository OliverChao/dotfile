local M = {
    'phaazon/hop.nvim',
    lazy = "VeryLazy",
    keys = {
        -- all window search
        { 'f', "<cmd> lua require'hop'.hint_char1({ hint_position = require'hop.hint'.HintPosition.START })<cr>" },
        { '<space>g', "<cmd> lua require'hop'.hint_char1({ hint_position = require'hop.hint'.HintPosition.START })<cr>", mode = { 'v', 's' } },

        -- current line search
        { 't', "<cmd>lua require'hop'.hint_char1({ current_line_only = true })<cr>" },
        { '<space>t', "<cmd>lua require'hop'.hint_char1({ current_line_only = true })<cr>", mode = { 'v', 's' } },

        -- go to lines
        { '<space>l', "<cmd> lua require'hop'.hint_lines({ hint_position = require'hop.hint'.HintPosition.START })<cr>", mode = { 'n', 'v' } }

    },
}

function M.config()
    require 'hop'.setup {}
end

return M
