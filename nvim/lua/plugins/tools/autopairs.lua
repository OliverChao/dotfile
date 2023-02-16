local M = {
  "windwp/nvim-autopairs",
  -- lazy = false,
  event = "BufReadPre",
}

function M.config()
  -- Setup nvim-cmp.
  -- local remap = vim.api.nvim_set_keymap
  local status_ok, npairs = pcall(require, "nvim-autopairs")
  if not status_ok then
    return
  end

  npairs.setup({
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      java = false,
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- Offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },
    -- default values is commented:
    -- disable_in_macro = false, -- disable when recording or executing a macro
    -- disable_in_visualblock = false, -- disable when insert after visual block mode
    -- ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
    -- enable_moveright = true,
    -- enable_afterquote = true, -- add bracket pairs after quote
    -- enable_check_bracket_line = true, --- check bracket in same line
    -- enable_bracket_in_quote = true, --
    -- map_cr = true,
    map_bs = true, -- map the <BS> key
    map_c_h = true, -- Map the <C-h> key to delete a pair
    map_c_w = true, -- map <c-w> to delete a pair if possible
  })

  -- local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  -- local cmp_status_ok, cmp = pcall(require, "cmp")
  -- if not cmp_status_ok then
  --     return
  -- end
  -- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
  --
  --
  -- INFO: Rules:

  local Rule = require("nvim-autopairs.rule")
  npairs.add_rule(Rule("%w+%s+%=>$", " {  }", { "rust" }):use_regex(true):set_end_pair_length(2))

  -- -- https://github.com/rstacruz/vim-closer/blob/master/autoload/closer.vim
  -- local get_closing_for_line = function(line)
  --     local i = -1
  --     local clo = ''
  --
  --     while true do
  --         i, _ = string.find(line, "[%(%)%{%}%[%]]", i + 1)
  --         if i == nil then break end
  --         local ch = string.sub(line, i, i)
  --         local st = string.sub(clo, 1, 1)
  --
  --         if ch == '{' then
  --             clo = '}' .. clo
  --         elseif ch == '}' then
  --             if st ~= '}' then return '' end
  --             clo = string.sub(clo, 2)
  --         elseif ch == '(' then
  --             clo = ')' .. clo
  --         elseif ch == ')' then
  --             if st ~= ')' then return '' end
  --             clo = string.sub(clo, 2)
  --         elseif ch == '[' then
  --             clo = ']' .. clo
  --         elseif ch == ']' then
  --             if st ~= ']' then return '' end
  --             clo = string.sub(clo, 2)
  --         end
  --     end
  --
  --     return clo
  -- end
  -- -- npairs.remove_rule('(')
  -- -- npairs.remove_rule('{')
  -- -- npairs.remove_rule('[')
  --
  -- npairs.add_rule(Rule("[%(%{%[]", "")
  --     :use_regex(true)
  --     :replace_endpair(function(opts)
  --         return get_closing_for_line(opts.line)
  --     end)
  --     :end_wise(function(opts)
  --         -- Do not endwise if there is no closing
  --         return get_closing_for_line(opts.line) ~= ""
  --     end))
end

return M
