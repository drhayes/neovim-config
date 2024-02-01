-- local node = os.getenv('HOME') .. '/.asdf/installs/nodejs/18.9.0/bin/node'

return {
  {
    'zbirenbaum/copilot.lua',
    lazy = true,
    cmd = 'Copilot',
    config = function()
      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          norg = false,
        },
      })
    end,
  },

  {
    'zbirenbaum/copilot-cmp',
    dependencies = {
      'zbirenbaum/copilot.lua',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      require('copilot_cmp').setup()
    end,
  },
}
