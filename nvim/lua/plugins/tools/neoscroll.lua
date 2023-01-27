local M = {
    "karb94/neoscroll.nvim",
    -- lazy = false,
    event = "BufReadPre",
}

function M.config()

    local status_ok, neoscroll = pcall(require, "neoscroll")
    if not status_ok then
        return
    end

    neoscroll.setup {
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-y>", "<C-e>", "zz" },
    }


    local t    = {}
    -- Syntax: t[keys] = {function, {function arguments}}
    -- t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '250' } }
    -- t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '250' } }
    -- t['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '450' } }
    -- t['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450' } }
    t['<C-y>'] = { 'scroll', { '-0.10', 'false', '80' } }
    t['<C-e>'] = { 'scroll', { '0.10', 'false', '80' } }
    -- t['zt']    = { 'zt', { '200' } }
    t['zz']    = { 'zz', { '100' } }
    -- t['zb']    = { 'zb', { '200' } }
    -- t['gg']    = { 'scroll', { '-2*vim.api.nvim_buf_line_count(0)', 'true', '1', '5', e } }
    -- t['G']     = { 'scroll', { '2*vim.api.nvim_buf_line_count(0)', 'true', '1', '5', e } }

    require('neoscroll.config').set_mappings(t)

end

return M
