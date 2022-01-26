local function map(mode, key, result, opts)
  local map_opts = {
    noremap = true,
    silent = opts.silent or false,
    expr = opts.expr or false,
    script = opts.script or false
  }
  if not opts.buffer then
    vim.api.nvim_set_keymap(mode, key, result, map_opts)
  else
    local buffer = opts.buffer
    if buffer == true then
      buffer = 0
    end
    vim.api.nvim_buf_set_keymap(buffer, mode, key, result, map_opts)
  end
end

local opts = { noremap = true, silent = true, }

map('n', 'gw', '<cmd>FuzzyMotion<cr>', opts)
