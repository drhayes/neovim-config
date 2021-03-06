local g = vim.g

local NvimTree = {}

function NvimTree.setup()
  -- g.nvim_tree_indent_markers = 1
  g.nvim_tree_git_hl = 1
  g.nvim_tree_root_folder_modifier = ':~'
  g.nvim_tree_show_icons = {
      git = 1,
      folders = 1,
      files = 1,
      }

  g.nvim_tree_icons = {
      default = '',
      symlink = '',
      git = {
        unstaged = '✗',
        staged = '✓',
        unmerged = '',
        renamed = '➜',
        untracked = '★'
      },
      folder = {
        default = '',
        open = '',
        symlink = '',
      },
    }

  require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = true,
    ignore_ft_on_setup  = { 'startify', 'outline' },
    open_on_tab         = false,
    update_to_buf_dir   = {
      enable = true,
      auto_open = true,
    },
    hijack_cursor       = false,
    update_cwd          = false,
    update_focused_file = {
      enable      = true,
      update_cwd  = false,
      ignore_list = {}
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
    diagnostics = {
      enable = true,
      icons = {
        hint = '',
        info = '',
        warning = '',
        error = '✘',
      }
    },
    filters = {
      custom = { '.git', 'node_modules', '.cache' },
      dotfiles = true,
    },
    view = {
      width = 30,
      height = 30,
      side = 'left',
      auto_resize = false,
      mappings = {
        custom_only = false,
        list = {}
      }
    }
  }
end

return NvimTree
