local opt = vim.opt

opt.autoindent = true
opt.autoread = true
opt.autowrite = true
opt.autowriteall = true
opt.breakindent = true
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
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
opt.hidden = true
opt.ignorecase = true
opt.inccommand = 'split'
opt.incsearch = true
opt.linebreak = true
opt.list = true
opt.listchars = {
  --eol='¬',
  conceal = '┊',
  extends = '…',
  nbsp = '␣',
  precedes = '…',
  tab = '» ',
  trail = '·',
}
opt.mouse = 'a'
opt.number = true
opt.scrolloff = 4
opt.shell = '/usr/bin/fish'
opt.shiftwidth = 2
opt.showmode = false
opt.signcolumn = 'yes'
opt.softtabstop = 2
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.updatetime = 250

vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)
