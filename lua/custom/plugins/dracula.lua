return {
  'Mofiqul/dracula.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  opts = {
    colors = {
      -- Override dracula's comment color because it's too drak -- lol, typo, I meant dark but I'm keeping it.
      comment = '#95a5d7',
    },
  },
  config = function(_, opts)
    require('dracula').setup(opts)
    -- vim.cmd.colorscheme('dracula')
  end,
}
