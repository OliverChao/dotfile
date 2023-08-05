local dashboard = require("plugins.ui.dashboard")
local bufferline = require("plugins.ui.bufferline")
local lualine = require("plugins.ui.lualine")
local dressing = require("plugins.ui.dressing")
local bqf = require("plugins.ui.nvim-bqf")
local indent_blank_line = require("plugins.ui.indent-blankline")
local hlslens = require("plugins.ui.hlslens")
local notify = require("plugins.ui.notify")
local tint = require("plugins.ui.tint")

-- not used
local scrollbar = require("plugins.ui.scrollbar")

return {
  dashboard,
  lualine,
  bufferline,
  dressing,
  bqf,
  indent_blank_line,
  hlslens,
  notify,
  tint,

  scrollbar,
}
