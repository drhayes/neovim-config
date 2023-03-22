-- local node = os.getenv("HOME") .. "/.asdf/installs/nodejs/18.9.0/bin/node"

return {
  -- {
  --   "github/copilot.vim",
  -- },

  {
    "zbirenbaum/copilot.lua",
    lazy = true,
    config = function()
      -- config = function(plugin)
      require("copilot").setup()
      -- require("copilot").setup(plugin.opts)
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
