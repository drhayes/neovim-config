return {
  'pwntester/octo.nvim',
  cmd = 'Octo',
  opts = {
    -- or "fzf-lua" or "snacks" or "default"
    picker = 'snacks',
    -- bare Octo command opens picker of commands
    enable_builtin = true,
  },
  init = function()
    local wk = require('which-key')
    wk.add({
      { '<leader>o', group = 'Octo', mode = 'n' },
      { '<leader>oi', '<cmd>Octo issue list<cr>', desc = 'List GitHub [I]ssues' },
      { '<leader>op', '<cmd>Octo pr list<cr>', desc = 'List GitHub [P]ullRequests' },
      { '<leader>od', '<cmd>Octo discussion list<cr>', desc = 'List GitHub [D]iscussions' },
      { '<leader>on', '<cmd>Octo notification list<cr>', desc = 'List GitHub [N]otifications' },
      {
        '<leader>os',
        function()
          require('octo.utils').create_base_search_command({ include_current_repo = true })
        end,
        desc = '[S]earch GitHub',
      },
    })
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- 'nvim-telescope/telescope.nvim',
    -- OR "ibhagwan/fzf-lua",
    'folke/snacks.nvim',
    'nvim-tree/nvim-web-devicons',
  },
}
