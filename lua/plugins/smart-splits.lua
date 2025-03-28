return {
  {
    'mrjones2014/smart-splits.nvim',
    keys = {
      {
        '<C-h>',
        function()
          require('smart-splits').move_cursor_left()
        end,
        desc = 'Smart splits move cursor left',
      },
      {
        '<C-j>',
        function()
          require('smart-splits').move_cursor_down()
        end,
        desc = 'Smart splits move cursor down',
      },
      {
        '<C-k>',
        function()
          require('smart-splits').move_cursor_up()
        end,
        desc = 'Smart splits move cursor up',
      },
      {
        '<C-l>',
        function()
          require('smart-splits').move_cursor_right()
        end,
        desc = 'Smart splits move cursor right',
      },
      {
        '<A-h>',
        function()
          require('smart-splits').resize_left()
        end,
        desc = 'Smart splits resize left',
      },
      {
        '<A-j>',
        function()
          require('smart-splits').resize_down()
        end,
        desc = 'Smart splits resize down',
      },
      {
        '<A-k>',
        function()
          require('smart-splits').resize_up()
        end,
        desc = 'Smart splits resize up',
      },
      {
        '<A-l>',
        function()
          require('smart-splits').resize_right()
        end,
        desc = 'Smart splits resize right',
      },
    },
  },
}
