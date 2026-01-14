return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      {
        "copilotlsp-nvim/copilot-lsp",
        config = function()
          vim.g.copilot_nes_debounce = 500
        end
      },
    },
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        nes = {
          enabled = true,
          keymap = {
            accept_and_goto = "<leader>p",
            accept = false,
            dismiss = "<Esc>",
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          accept = false,
        },
        panel = {
          enabled = false,
        },
        filetypes = {
          ["*"] = true,
        },
      })

      vim.keymap.set("i", "<S-Tab>", function ()
        if (require("copilot.suggestion").is_visible()) then
          return require("copilot.suggestion").accept()
        else
          return vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true), "n", false)
        end
      end)
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
      { "gptlang/lua-tiktoken",  branch = "main" }
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
  },
  {
    "aweis89/ai-commit-msg.nvim",
    ft = "gitcommit",
    event = "VimEnter",
    config = true,
    opts = {
      enabled = true,
      provider = "copilot",
    },
  }
}
