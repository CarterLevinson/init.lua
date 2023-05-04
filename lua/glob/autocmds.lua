-- vim.fn.sign_define("LightBulbSign", {
--   text = "",
--   textl = "LspDiagnosticsDefaultInformation" }
-- )

--
-- local function update_lightbulb(error, result, context, config)
--   if not result == nil then
--   end
-- end
--
-- local function code_action_listener()
--   local params = vim.lsp.util.make_range_params()
--   params.context = { diagnostics = vim.diagnostic.get(0, {}) }
--   vim.lsp.buf_request(0, "textDocument/codeAction", params, function(err, result, ctx, config)
-- end

-- settings for terminal buffers since we can't use ftplugin
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("TerminalStart", {}),
  callback = function()
    local startinsert       = vim.cmd.startinsert
    local setlocal          = vim.opt_local
    setlocal.spell          = false
    setlocal.number         = false
    setlocal.relativenumber = false
    startinsert()
  end
})
