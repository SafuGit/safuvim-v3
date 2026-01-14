return {
  {
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
        },
        {
          name = "View Projects Palette",
          category = "Files",
          cmd = function ()
            vim.cmd("Project")
          end
        },
        {
          name = "Open Arena Buffers",
          category = "Buffers",
          cmd = function ()
            require("arena").toggle()
          end
        }
      },

      icons = {
        category = "󰉋",
        cmd = "󰘳 ",
        back = "← Go Back",
      }
    }
  },
}
