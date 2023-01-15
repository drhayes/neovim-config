return {
  "zbirenbaum/copilot.lua",
  event = { "VimEnter" },
  build = function()
    vim.defer_fn(function()
      require("copilot").setup({
	plugin_manager_path = os.getenv("LUNARVIM_RUNTIME_DIR") .. "/site/pack/packer",
      })
    end, 100)
  end,
}
