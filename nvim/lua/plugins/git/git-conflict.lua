local M = {
    'akinsho/git-conflict.nvim',
    event = "BufReadPre",
    keys = {
        { '[x', '<Plug>(git-conflict-prev-conflict)' },
        { ']x', '<Plug>(git-conflict-next-conflict)' },
        { '<leader>co', '<Plug>(git-conflict-ours)' },
        { '<leader>ct', '<Plug>(git-conflict-theirs)' },
        { '<leader>cb', '<Plug>(git-conflict-both)' },
        { '<leader>c0', '<Plug>(git-conflict-none)' },
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
end

return M
