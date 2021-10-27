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

  use('sheerun/vim-polyglot')

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

  -- Bootstrap if we don't already have it.
  if packer_bootstrap then
    require('packer').sync()
  end
end)
