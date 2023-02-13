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

    {
        -- A fancy, configurable, notification manager for NeoVim
        'rcarriga/nvim-notify',
        -- enabled = false,
        config = function()
            local notify = require("notify")
            notify.setup({
                render = "minimal", -- defult | minimal | simple | compact
                stages = "static", -- fade_in_slide_out | fade | slide | static
                timeout = 1000,
            })
            -- 使用 nvim-notify 插件代替 vim notify
            vim.notify = notify
        end
    }

}
