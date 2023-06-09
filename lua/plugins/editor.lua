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
    "echasnovski/mini.pairs",
    enabled = false,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      table.insert(opts.sources, {
        name = "emoji",
        option = {
          keyword_length = 1,
        },
      })
      table.insert(opts.sources, {
        name = "copilot",
        group_index = 2,
        option = {
          keyword_length = 1,
        },
      })
      opts.mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
      })
      return opts
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.prettier,
          nls.builtins.formatting.fish_indent,
          nls.builtins.diagnostics.fish,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          nls.builtins.diagnostics.flake8,
        },
      }
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

  {
    "bennypowers/webc.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = true,
  },

  {
    "Bekaboo/dropbar.nvim",
  },

  {
    "kchmck/vim-coffee-script",
  },
}
