return {
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'dracula',
    },
  },

  {
    'folke/tokyonight.nvim',
    opts = {
      style = 'moon',
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
}
