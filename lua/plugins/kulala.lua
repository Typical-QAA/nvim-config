return {
  "mistweaverco/kulala.nvim",
  opts = function(_, opts)
    opts.ui = opts.ui or {}
    opts.ui = {
      display_mode = "float",
      max_response_size = 1048576,
    }
  end,
}
