-- require('lualine').setup {
--   options = {
--     icons_enabled = true,
--     theme = 'auto',
--     component_separators = { left = '', right = ''},
--     section_separators = { left = '', right = ''},
--     disabled_filetypes = {},
--     always_divide_middle = true,
--     globalstatus = false,
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff', 'diagnostics'},
--     lualine_c = {'filename'},
--     lualine_x = {'encoding', 'fileformat', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   extensions = {}
-- }

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local gps = require("nvim-gps")
local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    -- sources = { "coc" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    -- symbols = { error = "  ", warn = "  " },
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
-- cool? function for progress
local progress = function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
end

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

require("lualine").setup({
    options = {
        icons_enabled = true,
        -- theme = "gruvbox-material",
        theme = 'auto',
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "|", right = "|" },
        -- section_separators = { left = "|", right = "|" },
        component_separators = '|',
        section_separators = { left = '', right = '' },
        -- "dapui_watches", "dapui_stacks", "dapui_scopes", "dapui_breakpoints"
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", },
        always_divide_middle = true,
        --
        -- all windows use one statusline
        -- nvim>=0.7 required
        globalstatus = true,
    },
    sections = {
        -- lualine_a = { "mode" },
        lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        -- lualine_b = { "branch", diff, diagnostics },
        lualine_b = { "branch", diff },
        -- lualine_b = { "branch", diagnostics },
        lualine_c = {
            {
                -- 'g:coc_status', 'bo:filetype'
                -- "bo:filename",
                -- 'g:coc_status',
                -- '%{coc#status()}',
                -- 'b:coc_current_function',
                -- "require'lsp-status'.status()",
                "lsp_progress",
                { "filename" },
                -- file_status = true, -- displays file status (readonly status, modified status)
                -- path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
                -- shorting_target = 30, -- Shortens path to leave 40 space in the window
                -- for other components. Terrible name any suggestions?
            },
            -- { gps.get_location, cond = gps.is_available },
        },
        lualine_x = {
            -- "diff",
            diagnostics,
            "encoding",
            -- "fileformat",
            {
                "filetype",
                colored = true, -- displays filetype icon in color if set to `true
                icon_only = false, -- Display only icon for filetype
            },
            -- {
            --   "filesize",
            --   icon = "",
            --   cond = conditions.buffer_not_empty,
            --   color = { fg = "#a3be8c" },
            -- },
        },
        lualine_y = {
            "progress",
        },
        -- lualine_y = { progress},
        -- lualine_z = { "location" },
        lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                "filename",
                file_status = true, -- displays file status (readonly status, modified status)
                path = 2, -- 0 = just filename, 1 = relative path, 2 = absolute path
                shorting_target = 30, -- Shortens path to leave 40 space in the window
                -- for other components. Terrible name any suggestions?
            },
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})
