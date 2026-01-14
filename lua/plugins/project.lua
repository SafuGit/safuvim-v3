return {
  {
    'DrKJeff16/project.nvim',
    dependencies = { -- OPTIONAL
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'ibhagwan/fzf-lua',
    },
    opts = {},
  },
  {
    "rmagatti/auto-session",
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@diagnostic disable-next-line: undefined-doc-name
    ---@type AutoSession.Config
    opts = {
      -- log_level = 'debug',
    },
  }
}
