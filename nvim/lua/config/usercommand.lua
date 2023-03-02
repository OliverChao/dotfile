-- ---------- User command ---------
-- INFO: ##### luasnip
vim.api.nvim_create_user_command("LuaSnipEdit", 'lua require("luasnip.loaders").edit_snippet_files()', { nargs = 0 })

-- INFO: " 避免手残输错
vim.api.nvim_create_user_command("W", "w", { nargs = 0 })
vim.api.nvim_create_user_command("Q", "q", { nargs = 0 })
vim.api.nvim_create_user_command("WQ", "wq", { nargs = 0 })
vim.api.nvim_create_user_command("Wq", "wq", { nargs = 0 })
vim.api.nvim_create_user_command("Wa", "wa", { nargs = 0 })
vim.api.nvim_create_user_command("Qa", "qa", { nargs = 0 })

-- ╭──────────────────────────────────────────────────────────╮
-- │                         Linters                          │
-- ╰──────────────────────────────────────────────────────────╯

vim.api.nvim_create_user_command("Golint", function()
  if vim.bo.filetype == "go" then
    if vim.fn.executable("golangci-lint") ~= 1 then
      vim.notify("Missing golangci-lint dependency", vim.log.levels.WARN, {
        on_open = function()
          vim.notify(
            "This linter[golangci-lint] can be download at\n[https://github.com/golangci/golangci-lint]",
            "info",
            { timeout = 3000 }
          )
        end,
      })
      return
    end
    vim.cmd([[ AsyncRun golangci-lint run % ]])
  end
end, { nargs = 0 })
