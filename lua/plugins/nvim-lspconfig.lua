return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.inlay_hints = opts.inlay_hints or {}
      opts.inlay_hints.enabled = false

      opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, {
        hyprls = {
          -- 0.11 native root detection using vim.fs
          root_dir = function(fname)
            return vim.fs.root(fname, { ".git", "hyprland.conf" })
          end,
          filetypes = { "hyprlang" },
        },
      })
    end,
  },
}
