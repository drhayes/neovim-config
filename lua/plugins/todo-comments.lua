return {
  'folke/todo-comments.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  build = function ()
    require('todo-comments').setup({})
  end,
  event = 'BufRead',
}
