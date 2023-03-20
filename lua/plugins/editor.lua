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

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = {},

        tsserver = {
          cmd = {
            "/home/drhayes/.asdf/installs/nodejs/19.8.1/bin/typescript-language-server",
            "--stdio",
          },
        },
      },

      setup = {
        eslint = function()
          require("lazyvim.util").on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
}
