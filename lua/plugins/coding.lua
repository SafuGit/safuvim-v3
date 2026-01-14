return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { -- set to setup table
    },
  },
  {
    "xzbdmw/colorful-menu.nvim",
  },
  {
    'sontungexpt/better-diagnostic-virtual-text',
    event = "LspAttach",
    config = function(_)
      require('better-diagnostic-virtual-text').setup()
    end
  }
}
