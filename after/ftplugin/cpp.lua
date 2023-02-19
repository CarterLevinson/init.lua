local setlocal = vim.opt_local
local api      = vim.api
setlocal.cindent = true
setlocal.cinoptions = vim.bo.cinoptions .. "L0"

api.nvim_create_augroup("Format", { clear = false })
api.nvim_create_autocmd("BufWritePost", {
  group = "Format",
  buffer = 0,
  callback = function() vim.lsp.buf.format{ async = true } end,
})

-- custom user commands based off toggle term functionality
api.nvim_buf_create_user_command(0, "Cppman",
  function(opts)
    vim.cmd [[new]]
    vim.cmd([[r ! cppman ]] .. opts.args)
    vim.cmd [[Man!]]
    vim.cmd [[1]]
  end,
  { nargs = 1, desc = "Browse cppreference using cppman" }
)
