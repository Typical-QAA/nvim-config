local is_nixos = vim.uv.fs_stat("/etc/NIXOS") ~= nil or vim.uv.fs_stat("/etc/static/nixos-version") ~= nil

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "nix",
          "lua",
          "vim",
          "vimdoc",
          "query",
        })
      end

      opts.auto_install = not is_nixos
    end,
  },
}
