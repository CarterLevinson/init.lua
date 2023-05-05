local M = {}

M.strip_path = function(path)
  return path:match '^.+/(.+)$'
end

M.strip_env = function(env)
  return M.strip_path(os.getenv(env))
end

return M
