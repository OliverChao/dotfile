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

--         ╭──────────────────────────────────────╮
--         │             Inlay Hints              │
--         ╰──────────────────────────────────────╯
vim.api.nvim_create_user_command("Inlay", function()
  local is_inlay_hint = not vim.lsp.inlay_hint.is_enabled(0)
  vim.lsp.inlay_hint.enable(0, is_inlay_hint)
  print(is_inlay_hint)
end, {
  nargs = 0,
})

-- ╭──────────────────────────────────────────────────────────╮
-- │                         Linters                          │
-- ╰──────────────────────────────────────────────────────────╯

vim.api.nvim_create_user_command("Lint", function()
  if vim.bo.filetype == "go" and vim.fn.executable("golangci-lint") == 1 then
    vim.cmd([[ AsyncRun golangci-lint run % ]])
  end
  -- if vim.fn.executable("golangci-lint") ~= 1 then
  --   vim.notify("Missing golangci-lint dependency", vim.log.levels.WARN, {
  --     on_open = function()
  --       vim.notify("This linter[golangci-lint] can be download using [Mason]", vim.log.levels.INFO, { timeout = 3000 })
  --     end,
  --   })
  --   return
  -- end
end, { nargs = 0 })

--  ╭──────────────────────────────────────╮
--  │         clear all registers          │
--  ╰──────────────────────────────────────╯
vim.api.nvim_create_user_command("ClearAllNormalRegisters", function()
  local regs = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

  for c in string.gmatch(regs, ".") do
    vim.fn.setreg(c, "")
  end
end, {
  nargs = 0,
})
