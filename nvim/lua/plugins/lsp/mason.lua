return {
    {
        'williamboman/mason.nvim',
        cmd = "Mason",
        opts = {
            ui = {
                border = "rounded",
            },
            -- The directory in which to install packages.
            install_root_dir = os.getenv("HOME") .. "/.lsp-server",
            -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
            -- packages that are requested to be installed will be put in a queue.
            max_concurrent_installers = 4,
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        enabled = false,
    },
}
