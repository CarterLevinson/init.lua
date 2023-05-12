local lspconfig = require 'lspconfig'
local cmp_lsp = require 'cmp_nvim_lsp'
local gp = require 'goto-preview'


local function lsp_format_buffer()
  vim.lsp.buf.format { async = true }
end

local function pretty_print(obj)
  vim.print(vim.inspect(obj))
end

local function print_lsp_ws_folders()
  pretty_print(vim.lsp.buf.list_workspace_folders())
end

local function bcmd(buffer, name, command)
  vim.api.nvim_buf_create_user_command(buffer, name, command, {})
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = create_augroup('Lspconfig'),
  callback = function(ev)
    local opts        = { buffer = ev.buf }

    nmap('gd',        vim.lsp.buf.definition, opts)
    nmap('gD',        vim.lsp.buf.declaration, opts)
    nmap('gr',        vim.lsp.buf.references, opts)     -- uses qf list
    nmap('gi',        vim.lsp.buf.implementation, opts) -- uses qf list

    nmap('gpd',       gp.goto_preview_definition, opts)
    nmap('gpt',       gp.goto_preview_type_definition, opts)
    nmap('gpr',       gp.goto_preview_references, opts)
    nmap('gpi',       gp.goto_preview_implementation, opts)
    nmap('gpc',       gp.close_all_win, opts)

    nmap('K',         vim.lsp.buf.hover, opts)
    nmap('<SPACE>f',  lsp_format_buffer, opts)
    nmap('<SPACE>t',  vim.lsp.buf.type_definition, opts)
    nmap('<SPACE>h',  vim.lsp.buf.signature_help, opts)

    -- imap('<C-h>',     vim.lsp.buf.signature_help, opts)

    nmap('<SPACE>wa', vim.lsp.buf.add_workspace_folder, opts)
    nmap('<SPACE>wr', vim.lsp.buf.remove_workspace_folder, opts)
    nmap('<SPACE>ls', print_lsp_ws_folders, opts)

    nmap('<SPACE>cl', vim.lsp.codelens.run, opts)

    -- create own lsp handler using inc preview + vim.ui
    -- nmap('<space>rn', ':IncRename ' , opts)
    nmap('<SPACE>rn', vim.lsp.buf.rename, opts)
    nmap('<SPACE>ca', cmd 'CodeActionMenu', opts)

    bcmd(opts.buffer, 'Format', lsp_format_buffer)
    bcmd(opts.buffer, 'ListWS', print_lsp_ws_folders)
  end,
})

-- change border for hover (in case we don't use pretty hover)
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'double' }
)

-- TODO: lsp signature help handler that displays virtual text as you type

-- change border for signature_help
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'double' }
)

-- default lsp configuration, others can extend from here
local defaults = {
  settings = {
    -- create nvim-cmp default capabilities for the lsp client
    capabilities = cmp_lsp.default_capabilities(),
    -- disable telemetry (if any)
    telemetry = { enable = false },
  },
  -- enable single file mode, if possible
  single_file_support = true,
}

-- list of installed lsp servers with default configurations
local servers = {
  awk_ls = {},
  bashls = {},
  cmake = {},
  cssls = {},
  html = {},
  pylsp = {},
  -- pyright = {},
  r_language_server = {},
  rust_analyzer = {},
  texlab = {},
}

-- setup each lsp server in list

-- local err = {}
for server, _ in pairs(servers) do
  -- if has(lsp.cmd) then
    lspconfig[server].setup(defaults)
  -- else
    -- err[server] = 'LSP: executable ' .. server .. 'not found'
  -- end
end

-- for _, msg in pairs(err) do
--   vim.notify(msg, vim.log.levels.WARN, {})
-- end
-- return default config
return defaults
