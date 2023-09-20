local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

return {
  { 'tpope/vim-unimpaired' },

  {
    'almo7aya/openingh.nvim',
    keys = {
      { '<leader>gr', '<cmd>OpenInGHRepo <cr>', desc = 'Open in GitHub repo' },
      { '<leader>gf', '<cmd>OpenInGHFile <cr>', desc = 'Open in GitHub file' },
    },
  },

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

      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = 'emoji' },
        { name = 'copilot', group_index = 2, option = { keyword_length = 2 } },
      }))

      cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping(function(fallback)
          local copilot_keys = vim.fn['copilot#Accept']()
          if cmp.visible() then
            cmp.confirm({ select = true })
          elseif copilot_keys ~= '' and type(copilot_keys) == 'string' then
            vim.api.nvim_feedkeys(copilot_keys, 'n', true)
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
      })

      -- opts.mapping = cmp.config.mapping(vim.tbl_extend('keep', opts.mapping or {}, {
      opts.mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<TAB>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      })
    end,
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = function()
      local nls = require('null-ls')
      return {
        root_dir = require('null-ls.utils').root_pattern('.null-ls-root', '.neoconf.json', 'Makefile', '.git'),
        sources = {
          nls.builtins.formatting.prettier,
          nls.builtins.formatting.fish_indent,
          nls.builtins.diagnostics.fish,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          nls.builtins.diagnostics.flake8,
        },
      }
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        eslint = {},

        tsserver = {
          cmd = {
            '/home/drhayes/.asdf/installs/nodejs/19.8.1/bin/typescript-language-server',
            '--stdio',
          },
        },
      },

      setup = {
        eslint = function()
          require('lazyvim.util').on_attach(function(client)
            if client.name == 'eslint' then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == 'tsserver' then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
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
}
