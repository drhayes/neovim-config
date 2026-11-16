return {
  'vhyrro/luarocks.nvim',
  priority = 1000,
  opts = {
    rocks = { 'lua-curl', 'nvim-nio', 'mimetypes', 'xml2lua' },
  },
  config = function(plugin, opts)
    -- luarocks 3.13+ vendors dkjson, which luarocks.nvim doesn't put on the path.
    package.path = package.path .. ';' .. plugin.dir .. '/.rocks/share/lua/5.1/luarocks/vendor/?.lua'
    require('luarocks-nvim').setup(opts)
  end,
}
