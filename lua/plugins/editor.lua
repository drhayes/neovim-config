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
    'nvimtools/none-ls.nvim',
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

  {
    'nvim-telescope/telescope.nvim',
    init = function()
      local actions = require('telescope.actions')
      actions.select_default:replace(function(prompt_bufnr)
        return actions.select_default() + actions.center(prompt_bufnr)
      end)
    end,
  },
}
