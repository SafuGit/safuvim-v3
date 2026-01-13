return {
  -- {
  --   'projekt0n/github-nvim-theme',
  --   name = 'github-theme',
  --   lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require('github-theme').setup({
  --       -- ...
  --     })

  --     vim.cmd('colorscheme github_dark_high_contrast')
  --   end,
  -- },
  {
    "https://gitlab.com/bartekjaszczak/luma-nvim",

    priority = 1000,
    config = function()
      require("luma").setup({
        theme = "dark",         -- "dark" or "light" theme
        contrast = "high"     -- "low", "medium" or "high" contrast
      })

      -- Activate the theme
      vim.cmd.colorscheme("luma")
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
