local servers = {
  awk = 'awk_ls',
  sh = 'bashls',
  cmake = 'cmake',
  css = 'cssls',
  html = 'html',
  -- python = 'pyright',
  lua = 'lua_ls',
  python = 'pylsp',
  r = 'r_language_server',
  rust = 'rust_analyzer',
  tex = 'texlab',
  plaintex = 'texlab',
}

vim.fn.sign_define("LightBulbSign", {
  text = "",
  textl = "LspDiagnosticsDefaultInformation" }
)

local function update_lightbulb(error, result, context, config)
  if not result == nil then
  end
end

local function code_action_listener()
  local params = vim.lsp.util.make_range_params()
  params.context = { diagnostics = vim.diagnostic.get(0, {}) }
  vim.lsp.buf_request(0, "textDocument/codeAction", params, function(err, result, ctx, config)
end
