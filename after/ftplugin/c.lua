local setlocal = vim.opt_local
setlocal.cindent = true
-- don't repeat comment when using single line "//"
setlocal.comments:remove("://")
setlocal.comments:append("f://")
