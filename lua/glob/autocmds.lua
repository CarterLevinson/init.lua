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
--
local function create_augroup(name)
  local opts = { clear = true }
  return vim.api.nvim_create_augroup(name, opts)
end

local function get_augroup(name)
  local opts = { clear = false }
  return vim.api.nvim_create_augroup(name, opts)
end

-- settings for terminal buffers since we can't use ftplugin
vim.api.nvim_create_autocmd('TermOpen', {
  group = create_augroup 'TerminalStart',
  callback = function()
    local setlocal = vim.opt_local
    setlocal.spell = false
    setlocal.number = false
    setlocal.relativenumber = false
    vim.cmd.startinsert()
  end,
})

-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = create_augroup 'YankHighlight',
  callback = function()
    vim.highlight.on_yank { timeout = 250 }
  end,
  pattern = '*',
})

-- show macro recording state
vim.api.nvim_create_autocmd('RecordingEnter', {
  group = create_augroup 'MacroRecord',
  callback = function()
    local set = vim.opt
    set.cmdheight = 1
  end,
  pattern = '*',
})

vim.api.nvim_create_autocmd('RecordingLeave', {
  group = get_augroup 'MacroRecord',
  callback = function()
    local set = vim.opt
    set.cmdheight = 0
  end,
  pattern = '*',
})
