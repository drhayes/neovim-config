return {

  -- local nvim_lsp = require('lspconfig')
  -- nvim_lsp.denols.setup {
  -- on_attach = on_attach,
  -- root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
  -- }

  -- nvim_lsp.tsserver.setup {
  -- on_attach = on_attach,
  -- root_dir = nvim_lsp.util.root_pattern("package.json"),
  -- single_file_support = false
  -- }
  {
    'neovim/nvim-lspconfig',
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        -- eslint = {},

        -- tsserver = {
        --   cmd = {
        --     '/home/drhayes/.asdf/installs/nodejs/19.8.1/bin/typescript-language-server',
        --     '--stdio',
        --   },
        --   root_dir = require('lspconfig/util').root_pattern('package.json'),
        --   single_file_support = false,
        -- },
        harper_ls = {
          filetypes = { 'markdown' },
        },

        cssls = {
          filetypes = { 'css' },
        },
      },

      denols = {
        root_dir = require('lspconfig/util').root_pattern('deno.json', 'deno.jsonc'),
        init_options = {
          lint = true,
          unstable = true,
        },
      },

      setup = {
        eslint = function()
          require('lazyvim.util').lsp.on_attach(function(client)
            if client.name == 'eslint' then
              client.server_capabilities.documentFormattingProvider = true
              -- elseif client.name == 'tsserver' then
              --   client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
}
