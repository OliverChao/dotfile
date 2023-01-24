local bufferline = require("plugins.ui.bufferline")
local lualine = require("plugins.ui.lualine")
local dressing = require("plugins.ui.dressing")
local bqf = require("plugins.ui.nvim-bqf")
local indent_blank_line = require("plugins.ui.indent-blankline")

return {
    lualine,
    bufferline,
    dressing,
    bqf,
    indent_blank_line,
}
