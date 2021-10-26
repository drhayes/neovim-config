local utils = require 'drhayes.utils'

-- These come in from the global vim object.
local g = vim.g
local a = vim.api

local augroup = utils.augroup

a.nvim_command('set nocompatible')
--a.nvim_command("profile start profile.log")
--a.nvim_command("profile func *")
--a.nvim_command("profile file *")

g.mapleader = ' '
g.maplocalleader = ','

-- set global, window and buffer options
require 'drhayes.options'


-- require plugins and stuff
-- require 'plugins'
-- require('_mappings').init_keymap()
-- require'plugin_config'
-- local theme = require'_theme'
-- theme.colorscheme_setup("catppuccino")
-- theme.overrides_setup()
-- require('_galaxyline')
-- require('_mappings').setup_ft_mappings()

-- a.nvim_exec([[
--   if has ("autocmd")
--     filetype plugin indent on
--   endif
-- ]], '')

augroup("vimrc-main", {
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

-- augroup("numbertoggle", {
--   {'BufEnter,FocusGained,InsertLeave,WinEnter', '*', 'if &nu | set rnu   | endif'},
--   {'BufLeave,FocusLost,InsertEnter,WinLeave',   '*', 'if &nu | set nornu | endif'},
-- })

-- -- we are done setting stuff up
-- a.nvim_command("silent! helptags ALL")

