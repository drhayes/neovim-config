return {
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    -- tag = "*",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-neorg/neorg-telescope',
    },
    config = function()
      require('neorg').setup({
        load = {
          ['core.defaults'] = {}, -- Loads default behaviour
          ['core.concealer'] = {}, -- Adds pretty icons to your documents
          ['core.dirman'] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = '~/notes',
              },
            },
          },
          ['core.export'] = {},
          ['core.export.markdown'] = {},
          ['core.integrations.telescope'] = {},
        },
      })
    end,
  },
}
