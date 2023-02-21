local setlocal      = vim.opt_local
setlocal.cinoptions = vim.bo.cinoptions .. "L0"

-- vim.api.nvim_create_augroup("Format", { clear = false })
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   group = "Format",
--   buffer = 0,
--   callback = function() vim.lsp.buf.format{ async = true } end,
-- })

-- custom user commands based off toggle term functionality
local function cppman(opts)
  vim.cmd [[new]]
  vim.cmd([[ r ! cppman ]] .. opts.args)
  vim.cmd [[1]]
end

buf_create_cmd(0, "Cppman", cppman, { nargs = 1 })
