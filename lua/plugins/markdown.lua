return {
  {
    'lukas-reineke/headlines.nvim',
    enabled = false,
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },

  -- {
  --   'mfussenegger/nvim-lint',
  --   opts = {
  --     linters = {
  --       markdownlint = {
  --         args = { '--disable', 'MD013', '--disable', 'MD034', '--' },
  --       },
  --     },
  --   },
  -- },
}
