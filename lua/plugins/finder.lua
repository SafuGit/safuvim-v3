return {
  -- {
  --   'nvim-telescope/telescope.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     -- optional but recommended
  --     { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  --   }
  -- },
  -- {
  --   'axkirillov/easypick.nvim',
  --   dependencies = { 'nvim-telescope/telescope.nvim' },
  -- },
  -- {
  --   'nvim-telescope/telescope-media-files.nvim',
  --   dependencies = { 'nvim-telescope/telescope.nvim' },
  -- }

  {
    "folke/snacks.nvim",
    ---@diagnostic disable-next-line: undefined-doc-name
    ---@type snacks.Config
    opts = {
      picker = {
        -- your picker configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below

        -- *TODO - Setup Finder keybinds with built-in pickers with my custom command palette
      }
    }
  },

  {
    'tamago324/lir.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
  },

  {
    -- *! YOU NEED sad AND fd FOR THIS!
    "mahyarmirrashed/search-and-replace.nvim",
    config = function()
      require("search-and-replace").setup()
    end,
  }

  -- *TODO - Configure search and replace in command palette
}
