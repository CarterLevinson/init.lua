return {
  'liuchengxu/vista.vim',
  keys = {
    { '<LEADER>s',   cmd 'Vista!!' },        -- \s:  toggle the vista window
    { '<LEADER>st',  cmd 'Vista!!' },        -- \st: toggle the vista window
    { '<LEADER>sf',  cmd 'Vista focus' },    -- \ss: focus open vista window
    { '<LEADER>sff', cmd 'Vista finder' },   -- \sf: run vista with finder exec
    { '<LEADER>st',  cmd 'Vista ctags' },    -- \st: open vista window using ctags
    { '<LEADER>sl',  cmd 'Vista nvim_lsp' }, -- \sl: open vista using nvim lsp
    { '<LEADER>si',  cmd 'Vista info' },     -- \si: echo important plugin info
    { '<LEADER>sc',  cmd 'Vista!' },         -- \sc: close open vista window
  },
  init = function()
    -- define some opts
    vim.g.vista_floating_border = 'double'
    vim.g.vista_sidebar_position = 'vertical topleft'
    vim.g.vista_close_fzf_select = 1
    vim.g.vista_update_on_text_changed = 1

    -- default
    vim.g.vista_close_on_jump = 0

    local ctags = {}

    -- use fast tags for haskell instead?
    ctags.haskell  = 'hasktags -x -o - -c'
    ctags.lhaskell = 'hasktags -x -o - -c'

    vim.g.vista_ctags_cmd = ctags

    -- default
    vim.g.vista_default_executive = 'ctags'

    -- all lsp filetypes except haskell & lhaskell
    local filetypes = {
      'awk',
      'c',
      'cmake',
      'cpp',
      'css',
      'cuda',
      'html',
      'objc',
      'objcpp',
      'proto',
      'json',
      'lua',
      'r',
      'python',
      'rust',
      'tex',
    }

    -- use lsp client instead of ctags if it makes sense
    local executives = {}
    for _, ft in ipairs(filetypes) do
      executives[ft] = 'nvim_lsp'
    end
    vim.g.vista_executive_for = executives

    -- set icons for tree display
    vim.g.vista_icon_indent = { '╰─➤ ', '├─➤ ' }
  end,
  lazy = true,
}
