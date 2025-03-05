return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
    opts = {
      rocks = { 'lua-curl', 'nvim-nio', 'mimetypes', 'xml2lua' },
    },
  },
  {
    'rest-nvim/rest.nvim',
    ft = 'http',
    dependencies = { 'luarocks.nvim' },
    init = function()
      local wk = require('which-key')
      wk.add({
        { '<leader>r', group = 'Rest', mode = 'n' },
        { '<leader>rr', '<cmd>Rest run<cr>', desc = 'Rest [r]un' },
        { '<leader>rl', '<cmd>Rest last<cr>', desc = 'Rest rerun [l]ast' },
        { '<leader>rg', '<cmd>Rest logs<cr>', desc = 'Rest lo[g]s' },
      })
    end,
  },
}
