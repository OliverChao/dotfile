
--  ╭──────────────────────────────────────────────────────────╮
--  │           programming languages configuration            │
--  ╰──────────────────────────────────────────────────────────╯
--
-- tabwidth
vim.cmd([[
autocmd FileType php,ruby,yaml set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType c,cpp set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType go set noexpandtab tabstop=4 shiftwidth=4
autocmd FileType coffee,javascript set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html,html,django,xhtml,haml set tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css set tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
]])

-- sepecial programming languages configuration
--
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

-- c && cpp
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "cpp", "c" },
    callback = function()
        vim.keymap.set('n', '<leader>ra', "<Cmd>AsyncRun g++ %; ./a.out; rm a.out<CR>")
        vim.keymap.set('n', '<leader>rt', '<Cmd>AsyncRun -mode=term -pos=floaterm g++ %; ./a.out; rm a.out<CR>')
    end
})
