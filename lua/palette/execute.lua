local usage = require("palette.usage")

local M = {}

function M.run(cmd, ctx)
  ctx = ctx or {}

  if cmd.when and not cmd.when(ctx) then
    return false
  end

  local ok, err = pcall(cmd.execute, ctx)
  if not ok then
    vim.notify(("Command failed: %s\n%s"):format(cmd.id, err), vim.log.levels.ERROR)
    return false
  end

  usage.record(cmd.id)
  return true
end

return M
