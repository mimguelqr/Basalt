-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.lsp.enable("lua_rs", true)

vim.opt.clipboard = "unnamedplus"
