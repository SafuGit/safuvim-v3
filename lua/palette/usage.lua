local M = {}

local data = {}

function M.record(id)
  local entry = data[id] or { count = 0, last = 0 }
  entry.count = entry.count + 1
  entry.last = os.time()
  data[id] = entry
end

function M.get(id)
  return data[id] or { count = 0, last = 0 }
end

function M.all()
  return data
end

return M