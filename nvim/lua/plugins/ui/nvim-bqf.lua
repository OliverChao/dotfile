local M = {
    'kevinhwang91/nvim-bqf',
    event = "BufReadPre",
}

function M.config()
    vim.cmd([[
    hi BqfPreviewBorder guifg=#50a14f ctermfg=71
    hi link BqfPreviewRange Search
    ]])
    require('bqf').setup({})
end

return M
