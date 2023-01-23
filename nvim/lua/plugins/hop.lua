local M = {
    'phaazon/hop.nvim',
    lazy = false,
}

function M.config()
    require 'hop'.setup {}

    -- place this in one of your configuration file(s)
    -- vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
    -- vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
    -- vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
    -- vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
    --
    --
    -- f is to map a char and F it to map a word
    vim.api.nvim_set_keymap('n', 'f',
        "<cmd> lua require'hop'.hint_char1({ hint_position = require'hop.hint'.HintPosition.START })<cr>", {})
    vim.api.nvim_set_keymap('o', 'f',
        "<cmd> lua require'hop'.hint_char1({ hint_position = require'hop.hint'.HintPosition.START })<cr>", {})
    vim.api.nvim_set_keymap('v', '<leader>F',
        "<cmd> lua require'hop'.hint_char1({ hint_position = require'hop.hint'.HintPosition.START })<cr>", {})
    -- vim.api.nvim_set_keymap('', 'F',
    --     "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.START })<cr>", {})
    -- vim.api.nvim_set_keymap('', 't',
    --     "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
    --     , {})
    vim.api.nvim_set_keymap('n', 't',
        "<cmd>lua require'hop'.hint_char1({ current_line_only = true })<cr>"
        , {})
    vim.api.nvim_set_keymap('o', 't',
        "<cmd>lua require'hop'.hint_char1({ current_line_only = true })<cr>"
        , {})
    vim.api.nvim_set_keymap('s', '<leader>T',
        "<cmd>lua require'hop'.hint_char1({ current_line_only = true })<cr>"
        , {})
    -- vim.api.nvim_set_keymap('n', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
    -- vim.api.nvim_set_keymap('v', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
    -- vim.api.nvim_set_keymap('o', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>", {})

    -- using <leader>
    -- vim.api.nvim_set_keymap('n', '<leader>w', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.START })<cr>", {})
    -- vim.api.nvim_set_keymap('n', '<leader>e', "<cmd> lua require'hop'.hint_char1({ hint_position = require'hop.hint'.HintPosition.AFTER_CURSOR })<cr>", {})
    -- vim.api.nvim_set_keymap('n', '<leader>l', "<cmd> lua require'hop'.hint_lines({ hint_position = require'hop.hint'.HintPosition.START })<cr>", {})

    -- using <space>
    -- word
    -- vim.api.nvim_set_keymap('n', '<space>w', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.START })<cr>", {})
    -- vim.api.nvim_set_keymap('v', '<space>w', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.START })<cr>", {})
    -- vim.api.nvim_set_keymap('o', '<space>w', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.START })<cr>", {})
    -- one char
    -- vim.api.nvim_set_keymap('n', '<space>c', "<cmd> lua require'hop'.hint_char1({ hint_position = require'hop.hint'.HintPosition.AFTER_CURSOR })<cr>", {})
    -- vim.api.nvim_set_keymap('v', '<space>c', "<cmd> lua require'hop'.hint_char1({ hint_position = require'hop.hint'.HintPosition.AFTER_CURSOR })<cr>", {})
    -- vim.api.nvim_set_keymap('o', '<space>c', "<cmd> lua require'hop'.hint_char1({ hint_position = require'hop.hint'.HintPosition.AFTER_CURSOR })<cr>", {})
    -- line
    vim.api.nvim_set_keymap('n', '<space>l',
        "<cmd> lua require'hop'.hint_lines({ hint_position = require'hop.hint'.HintPosition.START })<cr>", {})
    vim.api.nvim_set_keymap('v', '<space>l',
        "<cmd> lua require'hop'.hint_lines({ hint_position = require'hop.hint'.HintPosition.START })<cr>", {})
    vim.api.nvim_set_keymap('o', '<space>l',
        "<cmd> lua require'hop'.hint_lines({ hint_position = require'hop.hint'.HintPosition.START })<cr>", {})
    -- pattern
    vim.api.nvim_set_keymap('n', '<space>p',
        "<cmd> lua require'hop'.hint_patterns({ hint_position = require'hop.hint'.HintPosition.START })<cr>", {})
end

return M
