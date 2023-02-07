return {
    {
        "goolord/alpha-nvim",
        -- enabled = false,
        event = "VimEnter",
        opts = function()
            local dashboard = require("alpha.themes.dashboard")
            -- ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
            -- ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
            -- ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
            -- ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
            -- ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
            -- ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
            --
            -- INFO: some headers
            -- https://github.com/BeyondMagic/MaGiCK/blob/main/.config/nvim/lua/configuration/screen.lua
            local logo = [[
            ▀████▀▄▄              ▄█ 
            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ 
            ▄        █          ▀▀▀▀▄  ▄▀  
            ▄▀ ▀▄      ▀▄              ▀▄▀  
            ▄▀    █     █▀   ▄█▀▄      ▄█    
            ▀▄     ▀▄  █     ▀██▀     ██▄█   
            ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  
            █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  
            █   █  █      ▄▄           ▄▀   
            ]]
            local footer = [[
            Stay Hungry, Stay Foolish.
            ]]
            dashboard.section.header.val = vim.split(logo, "\n")
            dashboard.section.footer.val = vim.split(footer, "\n")
            dashboard.section.buttons.val = {
                dashboard.button("p", " " .. " Select project", ":Telescope project display_type=full <CR> "),
                dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
                dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
                dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
                -- dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
                dashboard.button("c", " " .. " Config", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
                -- dashboard.button("s", "勒" .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
            }
            for _, button in ipairs(dashboard.section.buttons.val) do
                button.opts.hl = "AlphaButtons"
                button.opts.hl_shortcut = "AlphaShortcut"
            end
            dashboard.section.footer.opts.hl = "AlphaHeader"
            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.buttons.opts.hl = "AlphaButtons"
            dashboard.opts.layout[1].val = 8
            return dashboard
        end,
        config = function(_, dashboard)
            vim.b.miniindentscope_disable = true

            -- close Lazy and re-open when the dashboard is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "AlphaReady",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            require("alpha").setup(dashboard.opts)

            -- vim.api.nvim_create_autocmd("User", {
            --     pattern = "LazyVimStarted",
            --     callback = function()
            --         local stats = require("lazy").stats()
            --         local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            --         dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
            --         pcall(vim.cmd.AlphaRedraw)
            --     end,
            -- })
        end,
    },
    {
        "folke/drop.nvim",
        enabled = false,
        event = "VimEnter",
        opts = {

            theme = "leaves", -- can be one of rhe default themes, or a custom theme
            max = 40, -- maximum number of drops on the screen
            interval = 250, -- every 150ms we update the drops
            screensaver = 1000 * 60 * 5, -- show after 5 minutes. Set to false, to disable
            filetypes = { "dashboard", "alpha", "starter" }, -- will enable/disable automatically for the following filetypes

        },
    }
}
