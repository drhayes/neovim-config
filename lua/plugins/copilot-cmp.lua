return {
  'zbirenbaum/copilot-cmp',
  dependencies = { 'zbirenbaum/copilot.lua' },
  build = function()
    require('copilot_cmp').setup()
  end,
}
