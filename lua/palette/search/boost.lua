local usage = require("palette.usage")

local M = {}

function M.apply(cmd, base_score)
  local u = usage.get(cmd.id)

  local boost = 0
  boost = boost + math.min(u.count * 2, 40)
  boost = boost + math.min((os.time() - u.last < 3600) and 20 or 0, 20)

  return base_score + boost
end

return M
