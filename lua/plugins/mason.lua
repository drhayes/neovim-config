return {
  'williamboman/mason.nvim',
  config = function()
    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    --
    --  Add any additional override configuration in the following tables. They will be passed to
    --  the `settings` field of the server config. You must look up that documentation yourself.
    local servers = {
      -- clangd = {},
      -- gopls = {},
      -- pyright = {},
      -- rust_analyzer = {},
      -- tsserver = {},

      sumneko_lua = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          ['runtime.version'] = 'LuaJIT',
          ['diagnostics.globals'] = {
            'vim',
            'love',
          },
        },
      },
    }

    -- Setup mason so it can manage external tooling
    require('mason').setup()

    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          -- capabilities = capabilities,
          on_attach = require('drhayes.keymappings').onLspAttach,
          settings = servers[server_name],
        }
      end,
    }

  end,
}
