return {
  {
    'voldikss/vim-floaterm',
    lazy = true,
    keys = {
      { '<leader>wf', '<cmd>FloatermToggle <cr>', desc = 'Open a [f]loating window', mode = 'n' },
      { '<F8>', '<cmd>FloatermToggle <cr>', desc = 'Open a [f]loating window', mode = 'n' },
      { '<F8>', '<cmd>FloatermToggle <cr>', desc = 'Toggle a floating window', mode = 't' },
    },
  },
}
