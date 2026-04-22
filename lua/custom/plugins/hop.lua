return {
  'phaazon/hop.nvim',
  config = function()
    require('hop').setup({})
  end,
  keys = {
    { '<leader>gw', '<cmd>HopWord<cr>', desc = '[G]o to [w]ord' },
    { '<leader>g1', '<cmd>HopChar1<cr>', desc = '[G]o to [1] character' },
  },
}
