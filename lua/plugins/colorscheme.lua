return {
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'tokyonight',
    },
    init = function()
      vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#51B3EC', bold = true })
      vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white', bold = true })
      vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#FB508F', bold = true })
    end,
  },

  {
    'folke/tokyonight.nvim',
    opts = {
      style = 'moon',
      styles = {
        sidebars = 'normal',
      },
      on_highlights = function(highlights, colors)
        highlights.LineNr.fg = '#b2b8cf'
      end,
    },
  },

  {
    'Mofiqul/dracula.nvim',
    opts = {
      colors = {
        -- Override dracula's comment color because it's too drak -- lol, typo, I meant dark but I'm keeping it.
        comment = '#95a5d7',
      },
    },
  },

  { 'EdenEast/nightfox.nvim' },

  { 'sainnhe/everforest' },

  {
    'oxfist/night-owl.nvim',
    -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
    -- config = function()
    --   -- load the colorscheme here
    --   vim.cmd.colorscheme('night-owl')
    -- end,
  },

  { 'shaunsingh/nord.nvim' },
}
