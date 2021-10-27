local nvim_command = vim.api.nvim_command
local fn = vim.fn

local stdpath = fn.stdpath
local empty = fn.empty
local glob = fn.glob
local system = fn.system

-- Bootstrap here.
local install_path = stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap

-- 0 if it is empty, 1 if it's not. Why not booleans? Compatability?
if empty(glob(install_path)) > 0 then
  -- When run with a list it doesn't run it inside a shell.
  packer_bootstrap = system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  nvim_command('packadd packer.nvim')
end

nvim_command('packadd packer.nvim')

local packer = require 'packer'

-- 'use' and 'use_rocks' are not actually injected here, packer is inserting
-- them into the environment.
return packer.startup(function(use)
  use('wbthomason/packer.nvim')
  use('mhinz/vim-startify')

  -- fuzzy stuff
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = [[require 'drhayes.telescope']],
  }
  use('nvim-telescope/telescope-fzy-native.nvim')
  use('nvim-telescope/telescope-fzf-writer.nvim')
  use('nvim-telescope/telescope-packer.nvim')
  use('nvim-telescope/telescope-github.nvim')
  use('nvim-telescope/telescope-symbols.nvim')
  use 'nvim-telescope/telescope-dap.nvim'
  use('cwebster2/github-coauthors.nvim')
  use {'junegunn/fzf', run = './install --all'}
  use 'junegunn/fzf.vim'

  -- Syntax
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
      config = [[require('drhayes.treesitter').setup()]]
    }
    use 'nvim-treesitter/playground'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use {
      'romgrk/nvim-treesitter-context',
      requires = {'nvim-treesitter/nvim-treesitter'}
    }
    use 'p00f/nvim-ts-rainbow'
    use 'windwp/nvim-ts-autotag'
    use {
      'SmiteshP/nvim-gps',
      requires = {'nvim-treesitter/nvim-treesitter'},
      config = [[require('drhayes.nvimgps').setup()]],
    }

  use({'Pocco81/Catppuccino.nvim',
    -- 'Pocco81/Catppuccino.nvim'
    -- 'GertjanReynaert/cobalt2-vim-theme',
    -- 'GlennLeo/cobalt2',
  --   requires = {'sheerun/vim-polyglot'},
    config = function()
      vim.cmd[[colorscheme catppuccino]]
    end
  })
  -- https://github.com/phanviet/vim-monokai-pro
  -- https://github.com/haishanh/night-owl.vim
  -- https://github.com/dracula/vim

  -- Github issue stuff.
  use 'pwntester/octo.nvim'

  -- debugging
  use 'mfussenegger/nvim-dap'
  use 'theHamsta/nvim-dap-virtual-text'
  use { 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }

  -- LSP stuff
  use 'neovim/nvim-lspconfig'
  use 'folke/lua-dev.nvim'
  use 'kosayoda/nvim-lightbulb'
  use('tami5/lspsaga.nvim')
  use {'nvim-lua/lsp-status.nvim'}
  use{'ray-x/lsp_signature.nvim'}
  use {
    'folke/lsp-trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = [[require('drhayes.trouble').setup()]],
  }

  -- What keys am I pressing?
  use {
    'folke/which-key.nvim',
    config = function()
      require('drhayes.whichkey').setup()
    end,
  }

  use 'sheerun/vim-polyglot'
  -- Bootstrap if we don't already have it.
  if packer_bootstrap then
    require('packer').sync()
  end
end)
