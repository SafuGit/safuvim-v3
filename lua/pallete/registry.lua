local Registry = {}

local commands = {}
local order = {}

local function normalize_category(cat)
  return string.lower(cat):gsub("%s+", ".")
end

local function normalize_action(action)
  local t = type(action)

  if t == "function" then
    return function(ctx)
      return action(ctx)
    end
  end

  if t == "string" then
    return function(ctx)
      vim.cmd(action)
    end
  end

  error("Invalid action type: " .. t)
end

function Registry.register(spec)
  assert(type(spec) == "table", "Command spec must be a table")
  assert(type(spec.id) == "string", "Command must have an id")
  assert(type(spec.title) == "string", "Command must have a title")
  assert(spec.action ~= nil, "Command must have an action")

  if commands[spec.id] then
    error("Duplicate command id: " .. spec.id)
  end

  local cmd = {
    id = spec.id,
    title = spec.title,
    category = normalize_category(spec.category or "general"),
    description = spec.description or "",
    keywords = spec.keywords or {},
    execute = normalize_action(spec.action),
    when = spec.when,
  }

  commands[cmd.id] = cmd
  table.insert(order, cmd.id)
end

function Registry.get(id)
  return commands[id]
end

function Registry.all()
  local result = {}
  for _, id in ipairs(order) do
    table.insert(result, commands[id])
  end
  return result
end

return Registry