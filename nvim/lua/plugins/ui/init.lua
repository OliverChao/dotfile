local dashboard = require("plugins.ui.dashboard")
local bufferline = require("plugins.ui.bufferline")
local lualine = require("plugins.ui.lualine")
local dressing = require("plugins.ui.dressing")
local bqf = require("plugins.ui.nvim-bqf")
local indent_blank_line = require("plugins.ui.indent-blankline")
local hlslens = require("plugins.ui.hlslens")

return {
    dashboard,
    lualine,
    bufferline,
    dressing,
    bqf,
    indent_blank_line,
    hlslens,
}
