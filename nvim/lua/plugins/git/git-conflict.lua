local M = {
    'akinsho/git-conflict.nvim',
    keys = {
        { '[x', '<Plug>(git-conflict-prev-conflict)' },
        { ']x', '<Plug>(git-conflict-next-conflict)' },
        { 'co', '<Plug>(git-conflict-ours)' },
        { 'ct', '<Plug>(git-conflict-theirs)' },
        { 'cb', '<Plug>(git-conflict-both)' },
        { 'c0', '<Plug>(git-conflict-none)' },
    },
}

function M.config()
    require('git-conflict').setup({
        default_mappings = false, -- disable buffer local mapping created by this plugin
        default_commands = true, -- disable commands created by this plugin
        disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
        highlights = { -- They must have background color, otherwise the default color will be used
            -- incoming = 'DiffText',
            incoming = 'DiffAdd',
            current = 'DiffAdd',
        }
    })
    -- refresh the buffer after load this plugin
    vim.cmd("e!")
end

return M
