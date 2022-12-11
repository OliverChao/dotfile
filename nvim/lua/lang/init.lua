-- go
--
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "go" },
    callback = function()
        vim.keymap.set('n', '<leader>ra', "<Cmd>AsyncRun go run $(VIM_FILEPATH)<CR>")
        vim.keymap.set('n', '<leader>rt', '<Cmd>AsyncRun -mode=term -pos=floaterm go run $(VIM_FILEPATH)<CR>'
        )
    end
})


-- rust
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "rust" },
    callback = function()
        vim.keymap.set('n', '<leader>ra', "<Cmd>AsyncRun cargo run<CR>")
        vim.keymap.set('n', '<leader>rt', '<Cmd>AsyncRun -mode=term -pos=floaterm cargo run<CR>')
    end
})

-- markdown
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown" },
    callback = function()
        vim.keymap.set('n', '<leader>mu', "<Cmd>UploadClipboard<CR>")
    end
})
