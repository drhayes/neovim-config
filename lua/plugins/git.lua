return {
  {
    'almo7aya/openingh.nvim',
    keys = {
      { '<leader>gr', '<cmd>OpenInGHRepo <cr>', desc = 'Open in GitHub repo' },
      { '<leader>gf', '<cmd>OpenInGHFile <cr>', desc = 'Open in GitHub file' },
    },
  },

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        map('n', '<leader>ghp', gs.preview_hunk, 'Preview Hunk')
      end,
    },
  },

  {
    'NeogitOrg/neogit',
    branch = 'master',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed, not both.
      'nvim-telescope/telescope.nvim', -- optional
      'ibhagwan/fzf-lua', -- optional
    },
    config = true,
    opts = {
      integrations = {
        diffview = true,
        telescope = true,
      },
    },
    init = function()
      local wk = require('which-key')
      wk.add({
        { '<leader>gg', '<cmd>Neogit<cr>', desc = '[N]eogit' },
      })
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
    init = function()
      local wk = require('which-key')
      wk.add({
        { '<leader>gR', '<cmd>Gitsigns reset_buffer<cr>', desc = '[R]eset buffer' },
        { '<leader>gS', '<cmd>Gitsigns stage_buffer<cr>', desc = '[S]tage buffer' },
        -- { '<leader>gb', '<cmd>Gitsigns blame_line<cr>', desc = '[B]lame line' },
        { '<leader>gp', '<cmd>Gitsigns preview_hunk<cr>', desc = '[P]review hunk' },
        { '<leader>gR', '<cmd>Gitsigns reset_hunk<cr>', desc = '[R]eset hunk' },
        { '<leader>gs', '<cmd>Gitsigns stage_hunk<cr>', desc = '[S]tage hunk' },
        { '<leader>gu', '<cmd>Gitsigns undo_stage_hunk<cr>', desc = '[U]nstage hunk' },
        { '[h', '<cmd>Gitsigns prev_hunk<cr>', desc = 'Previous hunk' },
        { ']h', '<cmd>Gitsigns next_hunk<cr>', desc = 'Next hunk' },
      })
    end,
  },

  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      -- OR 'ibhagwan/fzf-lua',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('octo').setup({
        suppress_missing_scope = {
          projects_v2 = true,
        },
      })
    end,
  },
}
