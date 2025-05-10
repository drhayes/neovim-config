return {
  -- {
  --   'm4xshen/hardtime.nvim',
  --   dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
  --   opts = {},
  -- },
  {
    'michaelrommel/nvim-silicon',
    lazy = true,
    cmd = 'Silicon',
    config = function()
      require('silicon').setup({
        theme = 'Dracula',
        to_clipboard = true,
      })
    end,
  },

  -- {
  --   'sphamba/smear-cursor.nvim',
  --   opts = {},
  -- },
}
