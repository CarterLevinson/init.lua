return {
  {
    "ibhagwan/fzf-lua", -- fuzzy finder
    dependencies = "nvim-web-devicons",
    config = function()
      require "cfg.fzf"
    end
  },
  {
    "kristijanhusak/vim-dadbod-ui", -- vim database interface
    dependencies = "tpope/vim-dadbod",
    cmd = { "DB", "DBUI" },
  },
  {
    "miversen33/netman.nvim", -- remote editing interface
    config = function()
      require "netman"
    end,
    lazy = true,
  },
  {
    "akinsho/toggleterm.nvim", -- better terminal integration
    keys = {
      { "<leader>t", },
      { "<leader>T",  cmd "ToggleTermSendCurrentLine" },
      { "<leader>tv", cmd "ToggleTermSendVisualSelection" },
      { "<leader>Tv", cmd "ToggleTermSendVisualLines" },
      { "<leader>tt", cmd "ToggleTermToggleAll" },
    },
    opts = {
      open_mapping = "<leader>t",

      terminal_mapping = true,
      persist_mode = true,
      close_on_exit = true,
      shade_terminals = true,

      float_opts = { border = "curved" },
    },
    version = "v2.*",
  },
  {
    "liuchengxu/vista.vim", -- lsp symbol / ctags browser
    dependencies = { "junegunn/fzf.vim", enabled = false },
    keys = {
      -- \s toggle the vista window
      { "<leader>s",  cmd "Vista!!" },
      -- \st toggle the vista window
      { "<leader>st", cmd "Vista!!" },
      -- \sf focus open vista window
      { "<leader>sf", cmd "Vista focus" },
      -- \sl open vista using nvim lsp
      { "<leader>sl", cmd "Vista nvim_lsp" },
      -- \sc: close open vista window
      { "<leader>sc", cmd "Vista!" },
    },
    config = function()
      require "cfg.vista"
    end,
  },
  {
    "folke/trouble.nvim", -- pretty diagnostic interface
    dependencies = "nvim-web-devicons",
    keys = {
      { "<leader>x",  cmd "TroubleToggle" },
      { "<leader>xt", cmd "TroubleToggle" },
      { "<leader>xw", cmd "Trouble workspace_diagnostics" },
      { "<leader>xd", cmd "Trouble document_diagnostics" },
      { "<leader>xq", cmd "Trouble quickfix" },
      { "<leader>xl", cmd "Trouble loclist" },
      { "<leader>xr", cmd "Trouble lsp_references" },
      { "<leader>xc", cmd "TroubleClose" },
      -- also, lsp definitions, lsp implementations,
      -- and lsp type definitions
    },
    config = function()
      require "trouble".setup { auto_close = true }
      vim.cmd [[cnoreabbrev copen  Trouble quickfix]]
      vim.cmd [[cnoreabbrev lopen  Trouble loclist]]
      vim.cmd [[cnoreabbrev cclose TroubleClose]]
      vim.cmd [[cnoreabbrev lclose TroubleClose]]
    end,
  },
  {
    "knubie/vim-kitty-navigator",
    cond = os.getenv("TERM") == "xterm-kitty",
    config = function()
      vim.g.kitty_navigator_no_mappings = 1
      ntmap("<C-h>", cmd "KittyNavigateLeft")
      ntmap("<C-j>", cmd "KittyNavigateDown")
      ntmap("<C-k>", cmd "KittyNavigateUp")
      ntmap("<C-l>", cmd "KittyNavigateRight")
    end,
    build = "cp ./*.py ~/.config/kitty/",
  },
  {
    "radenling/vim-dispatch-neovim", -- async build cmds
    dependencies = "tpope/vim-dispatch",
    config = function()
      vim.g.dispatch_no_maps          = 1
      vim.g.dispatch_no_tmux_start    = 1
      vim.g.dispatch_no_tmux_spawn    = 1
      vim.g.dispatch_no_tmux_make     = 1
      vim.g.dispatch_no_tmux_dispatch = 1
    end,
    cmd = { "Make", "Dispatch", "Start", "Spawn" },
  },
}
