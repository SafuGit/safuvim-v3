return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- optional but recommended
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
  },
  {
    'axkirillov/easypick.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },
  {
    'nvim-telescope/telescope-media-files.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  }
}
