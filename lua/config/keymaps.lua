-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

local modes = { "n", "v", "x" }
local arrow_to_vim = {
  ["<Left>"] = { key = "H", label = "LEFT" },
  ["<Down>"] = { key = "J", label = "DOWN" },
  ["<Up>"] = { key = "K", label = "UP" },
  ["<Right>"] = { key = "L", label = "RIGHT" },
}

for _, mode in ipairs(modes) do
  for arrow, mapping in pairs(arrow_to_vim) do
    map(mode, arrow, function()
      if _G.Snacks and Snacks.notifier then
        Snacks.notifier.notify(string.format("Stop! Use '%s' for %s", mapping.key, mapping.label), "warn", {
          title = "Colemak-DH Training",
          id = "arrow_nag_" .. arrow,
          style = "compact",
        })
      else
        vim.notify("Use " .. mapping.key, vim.log.levels.WARN)
      end
    end, { desc = "Force " .. mapping.key .. " for movement" })
  end
end

-- NOTE: move this to plugins
-- { "<leader>fF", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
map({ "n" }, "<leader><space>", function()
  Snacks.picker.pick("files", { root = false })
end, { desc = "Find Files (cwd)" })
