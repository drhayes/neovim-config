return {
  'rest-nvim/rest.nvim',
  ft = 'http',
  dependencies = { 'luarocks.nvim' },
  init = function()
    local wk = require('which-key')
    wk.add({
      { '<leader>r', group = 'Rest', mode = 'n' },
      { '<leader>rr', '<cmd>Rest run<cr>', desc = '[R]est [r]un' },
      { '<leader>rl', '<cmd>Rest last<cr>', desc = '[R]est rerun [l]ast' },
      { '<leader>rg', '<cmd>Rest logs<cr>', desc = '[R]est lo[g]s' },
    })
  end,
}
