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
          cmd = function()
            vim.cmd("Project")
          end
        },
        {
          name = "Open Arena Buffers",
          category = "Buffers",
          cmd = function()
            require("arena").toggle()
          end
        },
        {
          name = "Open Git UI",
          category = "Git",
          cmd = function()
            vim.cmd("Neogit")
          end
        },
        {
          name = "Github Issues List",
          category = "Git",
          cmd = function()
            vim.cmd("Octo issue list")
          end
        },
        {
          name = "Github Pull Requests List",
          category = "Git",
          cmd = function()
            vim.cmd("Octo pr list")
          end
        },
        {
          name = "Search Github",
          category = "Git",
          cmd = function()
            require("octo.utils").create_base_search_command { include_current_repo = true }
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
