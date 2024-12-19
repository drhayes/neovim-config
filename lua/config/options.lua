-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.filetype.add({
  extension = {
    njk = 'html',
    snowflake = 'sql',
    tid = 'html',
    handlebars = 'html',
  },
})

-- Only format when there's a prettier config file.
vim.g.lazyvim_prettier_needs_config = true

-- As per https://github.com/rachartier/tiny-inline-diagnostic.nvim
vim.diagnostic.config({ virtual_text = false })
