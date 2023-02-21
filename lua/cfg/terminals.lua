local terminal = require("toggleterm.terminal").Terminal

return {
  set_terminal_directory = function(term, dir)
    return vim.tbl_extend("force", terminal, { dir = dir })
  end,
  ghcup = terminal:new {
    cmd = "ghcup tui",
    go_back = 0,
    direction = "float",
    count = 100,
  },
  hdc = {
    cmd = "hdc",
    go_back = 0,
    direction = "vertical",
    count = 101,
  },
  ipython = terminal:new {
    cmd = "ipython",
    go_back = 0,
    size = 40,
    count = 102,
  },
  radian = terminal:new {
    cmd = "radian",
    go_back = 0,
    size = 40,
    count = 103,
  },
  htop = terminal:new {
    cmd = "htop",
    go_back = 0,
    direction = "float",
    count = 104,
  },
}

