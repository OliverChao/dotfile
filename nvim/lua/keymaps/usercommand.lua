-- ---------- User command ---------
-- INFO: ##### luasnip
vim.api.nvim_create_user_command("LuaSnipEdit", require("luasnip.loaders").edit_snippet_files, { nargs = 0 })

-- INFO: " 避免手残输错
vim.api.nvim_create_user_command("W", "w", { nargs = 0 })
vim.api.nvim_create_user_command("Q", "q", { nargs = 0 })
vim.api.nvim_create_user_command("WQ", "wq", { nargs = 0 })
vim.api.nvim_create_user_command("Wq", "wq", { nargs = 0 })
vim.api.nvim_create_user_command("Wa", "wa", { nargs = 0 })
vim.api.nvim_create_user_command("Qa", "qa", { nargs = 0 })
