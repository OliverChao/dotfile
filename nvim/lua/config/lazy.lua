local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

-- leader KEY
vim.g.mapleader = ","

-- require("lazy").setup("plugins2")
require("lazy").setup("plugins", {
    defaults = {
        lazy = false,
        version = false,
    },
    install = {
        -- install missing plugins on startup. This doesn't increase startup time.
        missing = true,
        -- try to load one of these colorschemes when starting an installation during startup
        colorscheme = { "gruvbox-material" }
    },
    ui = {
        -- a number <1 is a percentage., >1 is a fixed size
        size = { width = 0.8, height = 0.8 },
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        -- none | single | double | rounded | solid | shadow | ["╔", "═" ,"╗", "║", "╝", "═", "╚", "║"]
        border = "rounded",
        -- If you want to use a specific browser, you can define it here
        browser = nil, ---@type string?
        throttle = 20, -- how frequently should the ui process render events
        custom_keys = {
            -- you can define custom key maps here.
            -- To disable one of the defaults, set it to false
        }
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = false,
        notify = true, -- get a notification when changes are found
    },
    performance = {
        cache = {
            enabled = true,
            path = vim.fn.stdpath("cache") .. "/lazy/cache",
        },
        rtp = {
            disabled_plugins = {
                "rplugin",
                "gzip",
                "matchit",
                "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
