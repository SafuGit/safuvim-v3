local M = {}

function M.setup()
  vim.api.nvim_create_user_command("Palette", function()
    require("palette.ui.palette").open()
  end, {
    desc = "Open Command Palette",
  })
end

return M