return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "nvim-mini/mini.icons" },
    ---@module "fzf-lua"
    ---@diagnostic disable-next-line: undefined-doc-name
    ---@type fzf-lua.Config|{}
    ---@diagnostic disable: missing-fields
    opts = {}
    ---@diagnostic enable: missing-fields
  },
  { 'MunifTanjim/nui.nvim' },
}
