return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tsserver = {
          cmd = {
            vim.env.HOME
              .. '/.asdf/installs/nodejs/'
              .. vim.env.NEOVIM_NODE_VERSION
              .. '/bin/typescript-language-server',
            '--stdio',
          },
          root_dir = require('lspconfig/util').root_pattern('package.json'),
          single_file_support = false,
        },
      },
    },
  },
}
