return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  build = function ()
    require('lualine').setup({
      options = {
	icons_enabled = false,
	-- theme = 'tokyonight',
	component_separators = '|',
	section_separators = '',
      },
    })
  end
}
