local is_nixos = vim.uv.fs_stat("/etc/NIXOS") ~= nil or vim.uv.fs_stat("/etc/static/nixos-version") ~= nil
local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1

local disabled = is_nixos or is_windows

return {
  {
    "mason-org/mason.nvim",
    enabled = not disabled,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    enabled = not disabled,
  },
}
