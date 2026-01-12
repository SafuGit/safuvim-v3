return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
      { "gptlang/lua-tiktoken", branch = "main" }
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
  },
}
