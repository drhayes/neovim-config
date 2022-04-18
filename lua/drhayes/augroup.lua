local utils = require 'drhayes.utils'
local augroup = utils.augroup

augroup('vimrc-main', {
  -- Save when focus lost.
  {'FocusLost', '*', 'silent! wa'},
--   {'StdinReadPre', '*', 'let s:std_in=1'},
  -- strip trailing whitespace
  -- vim.cmd [[ autocmd BufWritePre * :%s/\s\+$//e ]],
--   -- starphleet
--   {'BufRead,BufNewFile', 'after_containerize,on_containerize,orders', 'set filetype=sh'},
--   {'BufRead,BufNewFile', '~/.zfunc/*', 'set filetype=zsh'},
--   -- tab management
--   {'TabLeave', '*', 'let g:lasttab = tabpagenr()'},
  -- highlight yanks
  {'TextYankPost', '*', 'silent! lua vim.highlight.on_yank { higroup="Visual", timeout=200 }' },
  {'FileType', 'markdown', 'setlocal spell'},
  {'FileType', 'yaml', 'setlocal ts=2 sts=2 sw=2 expandtab'},
  -- {'BufWritePost', 'plugins.lua', 'PackerCompile'},
  {'FileType', 'go', 'BufWritePre *.go :GoFmt', 'BufWritePre *.go :GoImports'}
})

augroup('packer_user_config', {
  {'BufWritePost', 'plugins.lua', 'source', '<afile>', '| PackerCompile'}
})

