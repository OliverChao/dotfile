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
  agents = {
    -- {
    --   name = "ChatGPT4",
    --   chat = true,
    --   command = false,
    --   -- string with model name or table with model name and parameters
    --   model = { model = "gpt-4-1106-preview", temperature = 1.1, top_p = 1 },
    --   -- system prompt (use this to specify the persona/role of the AI)
    --   system_prompt = "You are a general AI assistant.\n\n"
    --     .. "The user provided the additional info about how they would like you to respond:\n\n"
    --     .. "- If you're unsure don't guess and say you don't know instead.\n"
    --     .. "- Ask question if you need clarification to provide better answer.\n"
    --     .. "- Think deeply and carefully from first principles step by step.\n"
    --     .. "- Zoom out first to see the big picture and then zoom in to details.\n"
    --     .. "- Use Socratic method to improve your thinking and coding skills.\n"
    --     .. "- Don't elide any code from your output if the answer requires coding.\n"
    --     .. "- Take a deep breath; You've got this!\n",
    -- },
    {
      name = "ChatGPT3-5",
      chat = true,
      command = false,
      -- string with model name or table with model name and parameters
      model = { model = "gpt-3.5-turbo-1106", temperature = 1.1, top_p = 1 },
      -- system prompt (use this to specify the persona/role of the AI)
      system_prompt = "You are a general AI assistant.\n\n"
        .. "The user provided the additional info about how they would like you to respond:\n\n"
        .. "- If you're unsure don't guess and say you don't know instead.\n"
        .. "- Ask question if you need clarification to provide better answer.\n"
        .. "- Think deeply and carefully from first principles step by step.\n"
        .. "- Zoom out first to see the big picture and then zoom in to details.\n"
        .. "- Use Socratic method to improve your thinking and coding skills.\n"
        .. "- Don't elide any code from your output if the answer requires coding.\n"
        .. "- Take a deep breath; You've got this!\n",
    },
    -- {
    --   name = "CodeGPT4",
    --   chat = false,
    --   command = true,
    --   -- string with model name or table with model name and parameters
    --   model = { model = "gpt-4-1106-preview", temperature = 0.8, top_p = 1 },
    --   -- system prompt (use this to specify the persona/role of the AI)
    --   system_prompt = "You are an AI working as a code editor.\n\n"
    --     .. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
    --     .. "START AND END YOUR ANSWER WITH:\n\n```",
    -- },
    {
      name = "CodeGPT3-5",
      chat = false,
      command = true,
      -- string with model name or table with model name and parameters
      model = { model = "gpt-3.5-turbo-1106", temperature = 0.8, top_p = 1 },
      -- system prompt (use this to specify the persona/role of the AI)
      system_prompt = "You are an AI working as a code editor.\n\n"
        .. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
        .. "START AND END YOUR ANSWER WITH:\n\n```",
    },
  },
}

return {
  -- lazy.nvim
  {
    "robitx/gp.nvim",
    event = "VeryLazy",
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
