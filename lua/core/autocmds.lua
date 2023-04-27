local function format(diagnostics)
  local function prepend_source_name(d)
    if not d.source then
      return d
    end
    local t = vim.deepcopy(d)
    t.message = string.format("%s: %s", d.source, d.message)
    return t
  end
  return vim.tbl_map(prepend_source_name, diagnostics)
end

vim.api.nvim_create_autocmd("DiagnosticChanged", {
  group = vim.api.nvim_create_augroup("Diagnostics", {}),
  callback = function(args)
    local diagnostics = format(args.data.diagnostics)
    local items = vim.diagnostic.toqflist(diagnostics)
    vim.fn.setqflist({}, " ", { title = "Diagnostics", items = items })
  end
})

-- vim.fn.sign_define("LightBulbSign", { text = '' })
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
