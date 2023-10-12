return {
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      -- require("chatgpt").setup()
      require("chatgpt").setup({
        api_host_cmd = "echo api.chatanywhere.com.cn",
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
