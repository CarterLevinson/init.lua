local g = vim.g

return {
  {
    "liuchengxu/vista.vim", -- lsp symbol / ctags browser
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
      g.vista_icon_indent = { "╰─➤ ", "├─➤ " }
      g.vista_sidebar_position = "vertical topleft"
      g.vista_update_on_text_changed = 1
      g.vista_default_executive = "ctags"

      -- use fast tags instead?
      g.vista_ctags_cmd = {
        haskell  = "hasktags -x -o - -c",
        lhaskell = "hasktags -x -o - -c",
      }

      g.vista_executive_for = {
        awk      = "nvim_lsp",
        c        = "nvim_lsp",
        cpp      = "nvim_lsp",
        objc     = "nvim_lsp",
        objcpp   = "nvim_lsp",
        cuda     = "nvim_lsp",
        cmake    = "nvim_lsp",
        css      = "nvim_lsp",
        html     = "nvim_lsp",
        json     = "nvim_lsp",
        lua      = "nvim_lsp",
        python   = "nvim_lsp",
        proto    = "nvim_lsp",
        r        = "nvim_lsp",
        rust     = "nvim_lsp",
        tex      = "nvim_lsp",
      }
    end,
  }
}
