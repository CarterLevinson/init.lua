function _G.strip_path(path)
  return path:match("^.+/(.+)$")
end
