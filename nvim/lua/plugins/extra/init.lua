-- ╭─────────────────────────────────────────────────╮
-- │ some extra plugins, such as markdown, latex ... │
-- ╰─────────────────────────────────────────────────╯

local markdown = require("plugins.extra.markdown")
local tex = require("plugins.extra.tex")

return {
  markdown,
  tex,
}
