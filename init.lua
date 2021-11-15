local utils = require 'drhayes.utils'

-- These come in from the global vim object.
local g = vim.g
local a = vim.api

local augroup = utils.augroup

a.nvim_command('set nocompatible')

g.mapleader = ' '
g.maplocalleader = ','

-- set global, window and buffer options
require 'drhayes.options'

-- Get those plugins rolling.
require 'drhayes.plugins'

-- Do all our key mappings.
local keyMappings = require 'drhayes.keyMappings'
keyMappings.initKeymap()

-- require 'drhayes.snippets'
-- require 'drhayes.galaxyline'


-- a.nvim_exec([[
--   if has ("autocmd")
--     filetype plugin indent on
--   endif
-- ]], '')

augroup('vimrc-main', {
  -- Save when focus lost.
  {'FocusLost', '*', 'silent! wa'},
--   {'StdinReadPre', '*', 'let s:std_in=1'},
--   -- strip trailing whitespace
--   -- vim.cmd [[ autocmd BufWritePre * :%s/\s\+$//e ]]
--   -- starphleet
--   {'BufRead,BufNewFile', 'after_containerize,on_containerize,orders', 'set filetype=sh'},
--   {'BufRead,BufNewFile', '~/.zfunc/*', 'set filetype=zsh'},
--   -- tab management
--   {'TabLeave', '*', 'let g:lasttab = tabpagenr()'},
  -- highlight yanks
  {'TextYankPost', '*', 'silent! lua vim.highlight.on_yank { higroup="Visual", timeout=200 }' },
  {'FileType', 'markdown', 'setlocal spell'},
  {'FileType', 'yaml', 'setlocal ts=2 sts=2 sw=2 expandtab'},
  {'BufWritePost', 'plugins.lua', 'PackerCompile'},
  {'FileType', 'go', 'BufWritePre *.go :GoFmt', 'BufWritePre *.go :GoImports'}
})

augroup('packer_user_config', {
  {'BufWritePost', 'plugins.lua', 'source', '<afile>', '| PackerCompile'}
})

 -- we are done setting stuff up
 a.nvim_command("silent! helptags ALL")

