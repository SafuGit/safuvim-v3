local M = {}

local function normalize(str)
  return str:lower()
end

function M.build_entry(cmd)
  local parts = {
    cmd.title,
    cmd.category,
    cmd.description,
  }

  if cmd.keywords then
    for _, k in ipairs(cmd.keywords) do
      table.insert(parts, k)
    end
  end

  return {
    command = cmd,
    haystack = normalize(table.concat(parts, " ")),
  }
end

function M.build(commands)
  local index = {}
  for _, cmd in ipairs(commands) do
    table.insert(index, M.build_entry(cmd))
  end
  return index
end

return M