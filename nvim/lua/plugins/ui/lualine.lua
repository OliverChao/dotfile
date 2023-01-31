local M = {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
}

function M.config()

    local hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end

    -- local gps = require("nvim-gps")
    local diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn" },
        symbols = { error = " ", warn = " " },
        colored = false,
        -- red is too colorful
        -- colored = true,
        update_in_insert = false,
        always_visible = true,
    }

    local diff = {
        "diff",
        colored = false,
        symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
        cond = hide_in_width,
    }

    require("lualine").setup({
        options = {
            icons_enabled = true,
            -- theme = "gruvbox-material",
            theme = 'auto',
            component_separators = '|',
            section_separators = { left = '', right = '' },
            -- "dapui_watches", "dapui_stacks", "dapui_scopes", "dapui_breakpoints"
            -- disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", },
            disabled_filetypes = { "alpha", "dashboard", },
            always_divide_middle = true,
            --
            -- all windows use one statusline
            -- nvim>=0.7 required
            globalstatus = true,
        },
        sections = {
            lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
            lualine_b = { "branch", diff },
            lualine_c = {
                {
                    function() return require("nvim-navic").get_location() end,
                    cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
                },
            },
            lualine_x = {
                diagnostics,
                "encoding",
                -- "fileformat",
                {
                    "filetype",
                    colored = false,
                    icon_only = false,
                },
            },
            lualine_y = { "progress", },
            lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 } },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        extensions = {},
    })
end

return M
