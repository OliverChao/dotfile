local M = {
  "L3MON4D3/LuaSnip",
  build = "make install_jsregexp",
  lazy = true,
}

function M.config()
  -- NOTE: ==== 设置不同节点不同表示(当前主题下颜色没有用处, 只用符号标记)
  -- https://github.com/L3MON4D3/LuaSnip/wiki/Nice-Configs#hint-node-type-with-virtual-text
  local types = require("luasnip.util.types")
  local luasnip = require("luasnip")
  -- 具体的配置参数: https://github.com/L3MON4D3/LuaSnip#config
  luasnip.config.setup({
    history = false,
    -- NOTE: 设置了region_check_events 在进入InsertMode的时候会删除snippets
    -- 这或许可以防止光标乱跳, 但是, 又或许不设置可以更好的使用? 目前设置.
    region_check_events = "InsertEnter",
    update_events = "TextChanged,TextChangedI",
    delete_check_events = "TextChanged,TextChangedI",

    --
    enable_autosnippets = true,
    store_selection_keys = "zz",

    -- 不同的节点 现实不同的符号, 当前主题颜色不会显示区别, 使用符号判断
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "▼", "GruvboxOrange" } },
        },
      },
      [types.insertNode] = {
        active = {
          virt_text = { { "●", "GruvboxBlue" } },
        },
      },
    },
  })

  -- unlink current node session when leaves insert mode
  -- see: #258 && #656
  -- Issue: https://github.com/L3MON4D3/LuaSnip/issues/258
  -- Issue: https://github.com/L3MON4D3/LuaSnip/issues/656
  --
  -- local unlinkgrp = vim.api.nvim_create_augroup("UnlinkSnippetOnModeChange", { clear = true })
  -- vim.api.nvim_create_autocmd("ModeChanged", {
  --   group = unlinkgrp,
  --   pattern = { "s:n", "i:*" },
  --   desc = "Forget the current snippet when leaving the insert mode",
  --   callback = function(evt)
  --     if luasnip.session and luasnip.session.current_nodes[evt.buf] and not luasnip.session.jump_active then
  --       luasnip.unlink_current()
  --     end
  --   end,
  -- })

  require("luasnip.loaders.from_vscode").load({ paths = "./vs_snippets" })
  require("luasnip.loaders.from_lua").load({ paths = "./luasnippets" })
end

return M
