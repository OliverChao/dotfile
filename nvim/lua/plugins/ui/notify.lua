return {
    {
        -- A fancy, configurable, notification manager for NeoVim
        'rcarriga/nvim-notify',
        -- enabled = false,
        config = function()
            local notify = require("notify")
            notify.setup({
                minimum_width = 10,
                render = "minimal", -- defult | minimal | simple | compact
                stages = "static", -- fade_in_slide_out | fade | slide | static
                timeout = 1500,
            })
            -- 使用 nvim-notify 插件代替 vim notify
            vim.notify = notify
        end
    }
}
