-- test file

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

function get_visual(args, parent)
  if #parent.snippet.env.SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else
    return sn(nil, i(1, ""))
  end
end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
  s(
    "trigtest1",
    fmt([[ local {} = require({}) ]], {
      f(function(v)
        return v[1]
      end, { 1 }),
      i(1),
    }),
    { condition = line_begin }
  ),
  s(
    "trigtest2",
    fmt([[ local {} = require({}) ]], {
      rep(1),
      i(1),
    }),
    { condition = line_begin }
  ),
  -- Example: how to set snippet parameters
  ls.s(
    { -- Table 1: snippet parameters
      trig = "hi",
      dscr = "An autotriggering snippet that expands 'hi' into 'Hello, world!'",
      regTrig = false,
      priority = 100,
      snippetType = "autosnippet",
    },
    { -- Table 2: snippet nodes (don't worry about this for now---we'll cover nodes shortly)
      t("Hello, world!"), -- A single text node
    }
    -- Table 3, the advanced snippet options, is left blank.
  ),

  ls.s(
    { trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command." },
    fmta("\\textit{<>}", {
      d(1, get_visual),
    })
  ),
}
