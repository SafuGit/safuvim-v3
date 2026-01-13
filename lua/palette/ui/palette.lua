local NuiInput = require("nui.input")
local NuiMenu = require("nui.menu")
local state_mod = require("palette.ui.state")
local exec = require("palette.execute")

local M = {}

function M.open()
  local state = state_mod.new()

  local menu = NuiMenu({
    position = "50%",
    size = { width = 60, height = 15 },
    border = { style = "rounded" },
  }, {})

  local input = NuiInput({
    position = "50%",
    size = { width = 60 },
    border = { style = "rounded", text = { top = " Command Palette " } },
  }, {
    on_change = function(val)
      state.query = val
      state:update()

      local items = {}
      for _, r in ipairs(state.results) do
        table.insert(items, NuiMenu.item(r.command.title))
      end
      menu:set_items(items)
    end,
    on_submit = function()
      local sel = state.results[state.selected]
      if sel then
        exec.run(sel.command, { source = "palette" })
      end
      input:unmount()
      menu:unmount()
    end,
  })

  menu:mount()
  input:mount()
end

return M
