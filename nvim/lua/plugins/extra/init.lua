-- ╭─────────────────────────────────────────────────╮
-- │ some extra plugins, such as markdown, latex ... │
-- ╰─────────────────────────────────────────────────╯

local markdown = require("plugins.extra.markdown")
local tex = require("plugins.extra.tex")
local go = require("plugins.extra.go")

return {
  markdown,
  tex,

  go,

  -- {
  --   "rust-lang/rust.vim",
  -- },
}
