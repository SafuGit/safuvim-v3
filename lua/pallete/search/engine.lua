local M = {}

local fuzzy = require("palette.search.fuzzy")
local boost = require("palette.search.boost")

function M.search(index, query)
  local results = {}

  for _, entry in ipairs(index) do
    local base = fuzzy.score(query, entry.haystack)
    if base then
      local final = boost.apply(entry.command, base)
      table.insert(results, {
        command = entry.command,
        score = final,
      })
    end
  end

  table.sort(results, function(a, b)
    return a.score > b.score
  end)

  return results
end