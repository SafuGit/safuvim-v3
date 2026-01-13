local fuzzy = require("palette.search.fuzzy")

local M = {}

function M.search(index, query)
  local results = {}

  for _, entry in ipairs(index) do
    local score = fuzzy.score(query, entry.haystack)
    if score then
      table.insert(results, {
        command = entry.command,
        score = score,
      })
    end
  end

  table.sort(results, function(a, b)
    return a.score > b.score
  end)

  return results
end

return M