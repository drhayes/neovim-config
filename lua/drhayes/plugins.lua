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

  --------------
  -- THEME CHURN
  --------------

  -- vim.g.monokaipro_filter = 'machine'
  -- use({
  --   'https://gitlab.com/__tpb/monokai-pro.nvim',
  --   config = function()
  --     vim.cmd[[syntax enable]]
  --     vim.cmd[[colorscheme monokaipro]]
  --   end
  -- })

  -- use({
  --   'catppuccin/nvim',
  --   as = 'catppuccin',
  --   config = function()
  --     vim.cmd[[colorscheme catppuccin]]
  --   end,
  -- })

  -- use({
  --   'pineapplegiant/spaceduck',
  --   branch = 'main',
  --   config = function()
  --     vim.cmd([[
  --     if exists('+termguicolors')
  --       let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  --       let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  --       set termguicolors
  --     endif
  --     ]])
  --     vim.cmd([[colorscheme spaceduck]])
  --   end,
  -- })

  -- use({
  --   'lalitmee/cobalt2.nvim',
  --   requires = 'tjdevries/colorbuddy.nvim',
  -- })

  -- vim.g.monokaipro_filter = 'machine'
  -- use({
  --   'https://gitlab.com/__tpb/monokai-pro.nvim',
  --   -- 'mhartington/oceanic-next',
  --   config = function()
  --     vim.cmd[[syntax enable]]
  --     vim.cmd[[colorscheme monokaipro]]
  --   end,
  -- })

  use({
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd[[colorscheme tokyonight]]
    end
  })

  -- https://github.com/phanviet/vim-monokai-pro
  -- https://github.com/haishanh/night-owl.vim
  -- https://github.com/dracula/vim


    -- 'mhartington/oceanic-next',
    --'rmehri01/onenord.nvim',
    --'nanotech/jellybeans.vim',
    --'Pocco81/Catppuccino.nvim',
    -- 'GertjanReynaert/cobalt2-vim-theme',
    -- 'GlennLeo/cobalt2',
  --   requires = {'sheerun/vim-polyglot'},
    -- config = function()
    --   vim.cmd[[colorscheme tokyonight]]
      --vim.cmd[[colorscheme onenord]]
      -- vim.cmd[[syntax enable]]
      -- vim.cmd[[let g:oceanic_next_terminal_bold = 1]]
      -- vim.cmd[[let g:oceanic_next_terminal_italic = 1]]
      -- vim.cmd[[colorscheme OceanicNext]]
      -- require('drhayes.theme').setup()
    -- end
  -- })
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

  -- Tabs at the top.
  use {
    'akinsho/nvim-bufferline.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = "require('drhayes.bufferline').setup()",
  }

  -- Things at the bottom.
  use {
    'NTBBloodbath/galaxyline.nvim',
    branch='main',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- Things on the left side.
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = "require('drhayes.gitsigns').setup()",
  }

  -- Trailing whitespace generally sucks.
  use {
    'ntpeters/vim-better-whitespace',
    config = function ()
      local g = vim.g
      g.better_whitespace_enabled = 1
      g.strip_whitespace_on_save = 1
      g.strip_whitespace_confirm = 0
    end
  }

  -- Git in neovim?
 -- use {
--    'TimUntersberger/neogit',
--    requires = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim'},
--    config = "require('drhayes.neogit').setup()",
--  }

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('drhayes.lsp').setup()
      require('drhayes.completion').setup()
    end,
    requires = {
      -- 'L3MON4D3/LuaSnip',
      -- 'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ',
      'hrsh7th/cmp-vsnip',
      -- 'Saecki/crates.nvim',
      'f3fora/cmp-spell',
    },
  }

  use {
    'windwp/nvim-autopairs',
    config = function ()
      require('nvim-autopairs').setup()
    end
  }

  -- Set path searching options.
  use 'tpope/vim-apathy'

  -- Automatically insert end structures.
  -- use 'tpope/vim-endwise'

  -- Comments happen a lot.
  use 'tpope/vim-commentary'

  -- I often surround things with things.
  use 'tpope/vim-surround'

  -- Who doesn't want a tree view of their filesystem?
  -- use { 'kyazdani42/nvim-tree.lua',
    -- commit = "f1f1488",
    -- config = function()
      -- require('drhayes.nvim-tree').setup()
    -- end,
    --cmd = {"NvimTreeFindFile", "NvimTreeToggle"},
    --opt = true
  -- }

  use 'editorconfig/editorconfig-vim'

  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require('hop').setup({ keys = 'asdghklqwertyuiopzxcvbnmf' })
    end
  }

  use 'fladson/vim-kitty'

  use({
    'earthly/earthly.vim',
    branch = 'main'
  })

  use 'andymass/vim-matchup'

  use 'tpope/vim-unimpaired'

  -- Bootstrap if we don't already have it.
  if packer_bootstrap then
    require('packer').sync()
  end
end)
