local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

return {
  { 'tpope/vim-unimpaired' },

  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({})
    end,
  },

  {
    'tpope/vim-surround',
  },

  {
    'tpope/vim-commentary',
  },

  {
    'echasnovski/mini.surround',
    enabled = false,
  },

  {
    'echasnovski/mini.comment',
    enabled = false,
  },

  {
    'echasnovski/mini.pairs',
    enabled = false,
  },

  {
    'hrsh7th/nvim-cmp',
    lazy = false,
    dependencies = { 'hrsh7th/cmp-emoji' },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = 'emoji' },
        { name = 'copilot', group_index = 2, option = { keyword_length = 2 } },
      }))

      opts.mapping = vim.tbl_extend('force', opts.mapping, {
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            -- cmp.select_next_item()
            cmp.confirm({ select = true })

          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      })

      opts.mapping['<CR>'] = nil
      opts.mapping['<S-CR>'] = nil
    end,
  },

  {
    'bennypowers/webc.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    opts = true,
  },

  {
    'Bekaboo/dropbar.nvim',
  },

  {
    'kchmck/vim-coffee-script',
  },

  { 'tikhomirov/vim-glsl' },

  {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    init = function()
      local actions = require('telescope.actions')
      actions.select_default:replace(function(prompt_bufnr)
        return actions.select_default() + actions.center(prompt_bufnr)
      end)
    end,
  },

  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy', -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require('tiny-inline-diagnostic').setup({
        options = {
          break_line = {
            enabled = true,
            after = 50,
          },
        },
      })
    end,
  },

  {
    'folke/snacks.nvim',
    opts = {
      scroll = {
        enabled = false,
      },
    },
  },
}
