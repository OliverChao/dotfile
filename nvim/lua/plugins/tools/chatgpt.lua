-- Gp (GPT prompt) lua plugin for Neovim
-- https://github.com/Robitx/gp.nvim/

--------------------------------------------------------------------------------
-- Default config
--------------------------------------------------------------------------------

local config = {
  -- required openai api key
  openai_api_key = os.getenv("OPENAI_API_KEY"),
  -- api endpoint (you can change this to azure endpoint)
  openai_api_endpoint = "https://api.chatanywhere.com.cn/v1/chat/completions",
  -- openai_api_endpoint = "https://$URL.openai.azure.com/openai/deployments/{{model}}/chat/completions?api-version=2023-03-15-preview",
  chat_topic_gen_model = "gpt-3.5-turbo-1106",
}

return {
  -- lazy.nvim
  {
    "robitx/gp.nvim",
    -- event = "VeryLazy",
    cmd = {
      "GpNew",
      "GpChatFinder",
      "GpPopup",
      "GpPopup",
      "GpAppend",
      "GpRewrite",
      "GpPrepend",
      "GpStop",
      "GpAgent",
    },
    config = function()
      require("gp").setup(config)

      -- or setup with your own config (see Install > Configuration in Readme)
      -- require("gp").setup(config)

      -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
    end,
  },
  {
    "jackMort/ChatGPT.nvim",
    enabled = false,
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
