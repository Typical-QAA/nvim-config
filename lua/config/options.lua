-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.wrap = true
vim.opt.modeline = true
vim.opt.modelines = 5

vim.g.lazyvim_picker = "snacks"
vim.g.lazyvim_explorer = "snacks"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
vim.opt.foldlevel = 99

vim.filetype.add({
  extension = {
    hl = "hyprlang",
  },
  pattern = {
    ["Jenkinsfile"] = "groovy",
    ["hypr.*%.conf"] = "hyprlang",
  },
})
