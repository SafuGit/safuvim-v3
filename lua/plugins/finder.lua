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
    'tamago324/lir.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
  },

  {
    'MagicDuck/grug-far.nvim',
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    config = function()
      -- optional setup call to override plugin options
      -- alternatively you can set options with vim.g.grug_far = { ... }
      require('grug-far').setup({
        -- options, see Configuration section below
        -- there are no required options atm
      });
    end
  },
}
