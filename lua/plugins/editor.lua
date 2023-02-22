return {
  { "tpope/vim-unimpaired" },

  {
    "almo7aya/openingh.nvim",
    keys = {
      { "<leader>gr", "<cmd>OpenInGHRepo <cr>", desc = "Open in GitHub repo" },
      { "<leader>gf", "<cmd>OpenInGHFile <cr>", desc = "Open in GitHub file" },
    },
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
}
