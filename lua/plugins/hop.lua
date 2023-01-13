return {
  'phaazon/hop.nvim',
  build = function ()
    require('hop').setup()
  end,
  event = 'BufRead',
}
