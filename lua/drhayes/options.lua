local opt = vim.opt

local exists = vim.fn.exists
local isdirectory = vim.fn.isdirectory
local nvim_command = vim.api.nvim_command

local HOME_DIR = vim.fn.expand('$HOME')

-- local augroup = require("utils").augroup

opt.autoindent = true
opt.autoread = true
-- Just save all the damn time.
opt.autowrite = true
opt.autowriteall = true
opt.background = 'dark'
opt.backspace = 'indent,eol,start'
opt.backup = false
opt.clipboard = 'unnamedplus,unnamed'
opt.cmdheight = 2
opt.colorcolumn = '0'
opt.completeopt = 'menu,menuone'
opt.confirm = true
opt.cursorline = true
-- opt.diffopt = "filler,internal,algorithm:histogram,indent-heuristic"
opt.expandtab = true
opt.fillchars = {
  eob = '~',
  vert ='│',
}
-- opt.foldexpr='nvim_treesitter#foldexpr()'
-- opt.foldlevelstart = 99
opt.foldmethod = 'expr'
opt.foldenable = false
opt.formatoptions = opt.formatoptions
  - 'a' -- Auto formatting is BAD.
  - 't' -- Don't auto format my code. I got linters for that.
  + 'c' -- In general, I like it when comments respect textwidth
  + 'q' -- Allow formatting comments w/ gq
  - 'o' -- O and o, don't continue comments
  + 'r' -- But do continue when pressing enter.
  + 'n' -- Indent past the formatlistpat, not underneath it.
  + 'j' -- Auto-remove comments if possible.
  - '2' -- I'm not in gradeschool anymore
opt.guifont = "Inconsolata:h15"
opt.hidden = true
opt.hlsearch = true
opt.ignorecase = true
opt.inccommand = 'split'
opt.incsearch = true
opt.lazyredraw = true
opt.linebreak = true
opt.list = true
opt.listchars = {
  tab="▷ ",
  trail="·",
  extends="…",
  precedes="…",
  conceal="┊",
  nbsp="○",
  eol="¬",
}
opt.matchtime = 5
opt.mouse = 'a'
opt.number = true
-- opt.pastetoggle = "<F11>"
opt.previewheight = 25
opt.pumblend = 20
opt.scrolloff = 8
opt.shell = "/usr/bin/fish"
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess = vim.o.shortmess .. 'c'
opt.showmatch = true
opt.showmode = false
opt.sidescroll = 1
opt.sidescrolloff = 15
-- opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.smarttab = true
opt.softtabstop = 2
opt.splitbelow = true
-- opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
-- opt.textwidth = 80
-- opt.ttimeoutlen = 50
opt.updatetime = 500
opt.viewoptions = 'cursor,folds,options'
opt.virtualedit = 'onemore'
opt.wildmenu = true
opt.wildmode = 'longest,full'
opt.winblend = 30
opt.wrap = false
opt.writebackup = false
opt.visualbell = true

local function has(value)
  return vim.fn.has(value) == 1
end

-- if has('conceal') then
--   opt.conceallevel = 2
--   opt.concealcursor = "niv"
-- end

if exists('+undofile') == 1 then
  if isdirectory(HOME_DIR..'/.config/nvim/undo') == 0 then
      nvim_command([[:silent !mkdir -p ~/.config/nvim/undo > /dev/null 2>&1]])
  end
  opt.undodir = './.vim-undo//,' .. HOME_DIR .. '/.config/nvim/undo//'
  opt.undofile = true
end

if has('persistent_undo') then
  opt.undofile = true
  opt.undolevels = 250
  opt.undoreload = 500
end

-- augroup("ftspelloptions", {
--   {"FileType", "gitcommit", "set spell"},
-- })
