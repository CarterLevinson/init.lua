local strip_path = function(path)
  return path:match("^.+/(.+)$")
end

return {
  strip_path = strip_path
}
