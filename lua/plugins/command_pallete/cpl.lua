return {
  'AtleSkaanes/command-palette.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  version = "*",
  opts = {
    commands = {
      {
        name = "Open File Explorer (LIR)",
        category = "Files",
        cmd = function()
          require("lir.float").toggle()
        end,
      }
    },

    icons = {
      category = "󰉋",
      cmd = "󰘳 ",
      back = "← Go Back",
    }
  }
}
