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
      require("colorizer").setup({})
    end,
  },

  {
    "tpope/vim-surround",
  },

  {
    "tpope/vim-commentary",
  },

  {
    "echasnovski/mini.surround",
    enabled = false,
  },

  {
    "echasnovski/mini.comment",
    enabled = false,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        {
          name = "copilot",
          group_index = 2,
        },
        {
          name = "emoji",
        },
      }))
    end,
  },
}
