-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
    opts = {
      rocks = { 'lua-curl', 'nvim-nio', 'mimetypes', 'xml2lua' },
    },
  },
  {
    'rest-nvim/rest.nvim',
    ft = 'http',
    dependencies = { 'luarocks.nvim' },
    init = function()
      local wk = require('which-key')
      wk.add({
        { '<leader>r', group = 'Rest', mode = 'n' },
        { '<leader>rr', '<cmd>Rest run<cr>', desc = '[R]est [r]un' },
        { '<leader>rl', '<cmd>Rest last<cr>', desc = '[R]est rerun [l]ast' },
        { '<leader>rg', '<cmd>Rest logs<cr>', desc = '[R]est lo[g]s' },
      })
    end,
  },
  {
    'folke/snacks.nvim',
    ---@type snacks.Config
    opts = {
      picker = {
        -- your picker configuration comes here
        -- or leave it empty to use the default settings
      },
    },
    keys = {
      {
        '<leader>fe',
        function()
          Snacks.picker.explorer()
        end,
        desc = 'File explorer',
      },
    },
  },
  {
    'phaazon/hop.nvim',
    config = function()
      require('hop').setup({})
    end,
    keys = {
      { '<leader>gw', '<cmd>HopWord<cr>', desc = '[G]o to [w]ord' },
      { '<leader>g1', '<cmd>HopChar1<cr>', desc = '[G]o to [1] character' },
    },
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    'almo7aya/openingh.nvim',
    keys = {
      { '<leader>gr', '<cmd>OpenInGHRepo <cr>', desc = 'Open in GitHub repo' },
      { '<leader>gf', '<cmd>OpenInGHFile <cr>', desc = 'Open in GitHub file' },
    },
  },
  {
    'Mofiqul/dracula.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      colors = {
        -- Override dracula's comment color because it's too drak -- lol, typo, I meant dark but I'm keeping it.
        comment = '#95a5d7',
      },
    },
    config = function()
      vim.cmd.colorscheme('dracula')
    end,
  },
}
