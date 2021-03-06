local treesitter = {}

function treesitter.setup()
  local parsers = require 'nvim-treesitter.parsers'
  local parser_configs = parsers.get_parser_configs()

  parser_configs.http = {
    install_info = {
      url = "https://github.com/NTBBloodbath/tree-sitter-http",
      files = { "src/parser.c" },
      branch = "main",
    },
  }

  require('nvim-treesitter.configs').setup({
    ensure_installed = 'all',

    textobjects = {
      select = {
        enable = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
          -- ["ax"] = "@table.outer",
        }
      },
    },

    indent = {
      enable = true
    },

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
      disable = {},
    },

    -- Rainbow paren matching.
    rainbow = {
      enable = true,
      disable = {'bash'},
    },

    refactor = {
      highlight_definitions = { enable = true },
      highlight_current_scope = { enable = false },
    },

    autotag = {
      enable = true
    },

  })
end

return treesitter
