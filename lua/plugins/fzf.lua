return {
  {
    "ibhagwan/fzf-lua", -- fuzzy finder
    dependencies = "nvim-web-devicons",
    keys = {
      { "<leader>f",   cmd "FzfLua files" },
      { "<leader>l",   cmd "FzfLua live_grep" },
      { "<leader>g",   cmd "FzfLua grep_cword" },
      { "<leader>b",   cmd "FzfLua buffers" },
      { "<leader>fo",  cmd "FzfLua oldfiles" },
      { "<leader>fq",  cmd "FzfLua quickfix" },
      { "<leader>fl",  cmd "FzfLua loclist" },
      { "<leader>fg",  cmd "FzfLua git_files" },
      { "<leader>fgc", cmd "FzfLua git_commits" },
      { "<leader>fgb", cmd "FzfLua git_branches" },
      { "<leader>fd",  cmd "FzfLua lsp_definitions" },
      { "<leader>fr",  cmd "FzfLua lsp_references" },
      { "<leader>fs",  cmd "FzfLua lsp_workspace_symbols" },
      { "<leader>fi",  cmd "FzfLua lsp_implementations " },
    },
    cmd = "FzfLua",
    opts = { winopts = { fullscreen = true } },
  }
}