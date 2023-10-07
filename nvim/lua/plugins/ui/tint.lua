return {
  {
    -- Tint inactive windows in Neovim using window-local highlight namespaces.
    "levouh/tint.nvim",
    config = function()
      require("tint").setup({
        tint = -55, -- -- Darken colors, use a positive value to brighten
      })
    end,
  },
}
