local M = {}

function M.score(query, text)
  if query == "" then
    return 1
  end

  query = query:lower()
  local score = 0
  local qi = 1

  for i = 1, #text do
    if text:sub(i, i) == query:sub(qi, qi) then
      score = score + 10
      qi = qi + 1
      if qi > #query then
        return score
      end
    end
  end

  return nil
end

return M
