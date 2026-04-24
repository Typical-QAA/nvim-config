return {
  "chrisgrieser/nvim-scissors",
  opts = function(_, opts)
    opts.snippetDir = vim.fn.stdpath("config") .. "/snippets"
  end,
}
