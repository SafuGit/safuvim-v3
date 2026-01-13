local registry = require("palette.registry")
local indexer = require("palette.search.index")
local engine = require("palette.search.engine")

local M = {}

function M.new()
  local commands = registry.all()

  return {
    query = "",
    index = indexer.build(commands),
    results = {},
    selected = 1,
  }
end

function M:update()
  self.results = engine.search(self.index, self.query)
  self.selected = 1
end

return M