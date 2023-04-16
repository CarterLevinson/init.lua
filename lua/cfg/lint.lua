local lint = require("lint")

lint.linters_by_ft = {
  cmake   = { "cmakelint" },
  cpp     = { "cppcheck" },
  lua     = { "luacheck" },
  tex     = { "lacheck", "chktex" },
  python  = { "pylint" },
}

vim.api.nvim_create_augroup("Linters", {})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  group = "Linters",
  callback = function()
    lint.try_lint()
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost"}, {
  group = "Linters",
  callback = function()
    lint.try_lint("cspell")
    lint.try_lint("codespell")
  end
})
