local fzf = require "fzf-lua"

fzf.setup {
  winopts = { fullscreen = true },
  -- for null-ls compatability
  lsp = { async_or_timeout = 3000 },
}

-- fzf keymaps
nmap("<leader>f",   fzf.files)
nmap("<leader>l",   fzf.live_grep)
nmap("<leader>g",   fzf.grep_cword)
nmap("<leader>b",   fzf.buffers)
nmap("<leader>fo",  fzf.oldfiles)
nmap("<leader>fq",  fzf.quickfix)
nmap("<leader>fl",  fzf.loclist)

nmap("<leader>fg",  fzf.git_files)
nmap("<leader>fgc", fzf.git_commits)
nmap("<leader>fgb", fzf.git_branches)

nmap("<leader>fd",  fzf.lsp_definitions)
nmap("<leader>fr",  fzf.lsp_references)
nmap("<leader>fs",  fzf.lsp_workspace_symbols)
nmap("<leader>fi",  fzf.lsp_implementations)

-- nmap("<leader>fD", fzf.lsp_declarations)
-- nmap("<leader>fS", fzf.lsp_workspace_symbols)
-- nmap("<leader>fi", fzf.lsp_implementations)
-- nmap("<leader>fm", fzf.marks)
-- nmap("<leader>fr", fzf.registers)
