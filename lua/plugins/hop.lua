return {
  'phaazon/hop.nvim',
  config = function()
    require('hop').setup({})
  end,
  keys = {
    { '<leader>gw', '<cmd>HopWord<cr>', desc = 'Hop to word' },
    { '<leader>g1', '<cmd>HopChar1<cr>', desc = 'Hop to character' },
  },
}
