return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = function(_, opts)
      opts.flavour = "mocha"
      opts.transparent_background = true
      opts.no_underline = false

      opts.custom_highlights = opts.custom_highlights or {}
      opts.custom_highlights.SpellBad = { bg = "#ff0000" }
      opts.integrations = vim.tbl_deep_extend("force", opts.integrations or {}, {
        blink_cmp = true,
        snacks = true,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      opts.colorscheme = "catppuccin"
    end,
  },
}
