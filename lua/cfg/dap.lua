local dap = require("dap")

local debugger = "/vscode-cpptools/extension/debugAdapters/bin/OpenDebugAD7"

dap.adapters.cppdbg = {
  id = "cppdgb",
  type = "executable",
  command = vim.fn.stdpath("data") .. debugger
}

dap.configurations.cpp = {
  name = "Launch file",
  type = "cppdgb",
  -- program = function
}
