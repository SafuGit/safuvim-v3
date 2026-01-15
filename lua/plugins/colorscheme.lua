return {
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
        -- ...
      })

      -- vim.cmd('colorscheme github_dark_high_contrast')
    end,
  },
  {
    "https://gitlab.com/bartekjaszczak/luma-nvim",

    priority = 1000,
    config = function()
      require("luma").setup({
        theme = "dark",     -- "dark" or "light" theme
        contrast = "medium" -- "low", "medium" or "high" contrast
      })

      -- Activate the theme
      -- vim.cmd.colorscheme("luma")
    end
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme rose-pine")
    end
  },

  {
    'uloco/bluloco.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
      -- your optional config goes here, see below.
    end,
  },

  {
    "vague-theme/vague.nvim",
    lazy = false,  -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require("vague").setup({
        -- optional configuration here
      })
    end
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme kanagawa")
    end
  },

  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          {
            name = "github-dark-high-contrast",
            colorscheme = "github_dark_high_contrast",
          },
          {
            name = "luma-dark",
            colorscheme = "luma",
          },
          {
            name = "rose-pine",
            colorscheme = "rose-pine",
          },
          {
            name = "bluloco-dark",
            colorscheme = "bluloco-dark",
          },
          {
            name = "vague",
            colorscheme = "vague",
          },
          {
            name = "kanagawa-wave",
            colorscheme = "kanagawa-wave",
          },
          {
            name = "kanagawa-dragon",
            colorscheme = "kanagawa-dragon",
          },
          {
            name = "kanagawa-lotus (Light)",
            colorscheme = "kanagawa-lotus",
          },
        }
      })
    end
  },

  {
    "rachartier/tiny-devicons-auto-colors.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    event = "VeryLazy",
    config = function()
      require('tiny-devicons-auto-colors').setup()
    end
  }
}
