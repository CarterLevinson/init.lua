return {
  {
    "liuchengxu/vista.vim", -- lsp symbol / ctags browser
    dependencies = { "junegunn/fzf.vim", enabled = false },
    keys = {
      -- \s:  toggle the vista window
      { "<leader>s",  cmd "Vista!!" },
      -- \st: toggle the vista window
      { "<leader>st", cmd "Vista!!" },
      -- \sf: focus open vista window
      { "<leader>sf", cmd "Vista focus" },
      -- \sl: open vista using nvim lsp
      { "<leader>sl", cmd "Vista nvim_lsp" },
      -- \sc: close open vista window
      { "<leader>sc", cmd "Vista!" },
    },
    init = function()
      vim.g.vista_icon_indent = { '╰─➤ ', '├─➤ ' }
      vim.g.vista_sidebar_position = "vertical topleft"
      vim.g.vista_update_on_text_changed = 1
      vim.g.vista_default_executive = "ctags"

      vim.g.vista_ctags_cmd = {
        haskell  = "hasktags -x -o - -c",
        lhaskell = "hasktags -x -o - -c",

      }

      vim.g.vista_executive_for = {
        awk      = "nvim_lsp",
        bash     = "nvim_lsp",
        c        = "nvim_lsp",
        cpp      = "nvim_lsp",
        cmake    = "nvim_lsp",
        css      = "nvim_lsp",
        html     = "nvim_lsp",
        json     = "nvim_lsp",
        lua      = "nvim_lsp",
        python   = "nvim_lsp",
        r        = "nvim_lsp",
        tex      = "nvim_lsp",
      }
    end,
  }
}
