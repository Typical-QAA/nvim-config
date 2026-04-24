return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    local logo = [[
██████╗  █████╗ ██████╗ ██████╗  ██╗███████╗██████╗
██╔══██╗██╔══██╗██╔══██╗██╔══██╗███║██╔════╝██╔══██╗
██████╔╝███████║██║  ██║██║  ██║╚██║█████╗  ██████╔╝
██╔═══╝ ██╔══██║██║  ██║██║  ██║ ██║██╔══╝  ██╔══██╗
██║     ██║  ██║██████╔╝██████╔╝ ██║███████╗██║  ██║
╚═╝     ╚═╝  ╚═╝╚═════╝ ╚═════╝  ╚═╝╚══════╝╚═╝  ╚═╝
]]

    opts.dashboard = opts.dashboard or {}
    opts.dashboard.preset = opts.dashboard.preset or {}
    opts.dashboard.preset.header = logo

    opts.toggle = opts.toggle or {}
    opts.toggle.enabled = true
    opts.toggle.which_key = true
    opts.toggle.notify = true

    opts.notifier = opts.notifier or {}
    opts.notifier = vim.tbl_deep_extend("force", opts.notifier or {}, {
      enabled = true,
      timeout = 3000,
      style = "compact",
      top_down = true,
    })

    opts.explorer = opts.explorer or {}
    opts.explorer.enabled = true
    opts.explorer.hidden = true
    opts.explorer.replace_netrw = true
    opts.picker = opts.picker or {}
    opts.picker.enabled = true
  end,
  keys = {
    {
      "\\",
      function()
        local explorer_win = nil

        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
          local buf = vim.api.nvim_win_get_buf(win)
          local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })

          if ft == "snacks_picker_list" or ft == "snacks_explorer_tree" then
            explorer_win = win
            break
          end
        end

        if explorer_win then
          vim.api.nvim_win_close(explorer_win, true)
        else
          vim.ui.select({ "Yes", "No" }, {
            prompt = "Open Explorer? (Try <leader><space> for Files)",
          }, function(choice)
            if choice == "Yes" then
              Snacks.explorer()
            elseif choice == "No" then
              Snacks.notifier.notify(
                "Use <leader><space> for faster navigation!",
                "info",
                { title = "Architecture Tip" }
              )
            end
          end)
        end
      end,
      desc = "Smart Snacks Explorer Toggle",
    },
  },
}
