return {
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
        ['<leader>wn'] = { name = '[N]eotree', _ = 'which_key_ignore' },
        ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' },
      }
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    event = 'VeryLazy',
    dependencies = 'nvim-tree/nvim-web-devicons',
    enabled = false,
    keys = {
      { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
      { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
      { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle [p]in' },
      { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-[P]inned Buffers' },
      { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete [o]ther Buffers' },
      { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the [r]ight' },
      { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the [l]eft' },
      { '<leader>bd', '<Cmd>bd<CR>', desc = '[d]elete active buffer' },
    },
    opts = {
      -- highlights = require('catppuccin.groups.integrations.bufferline').get(),
      options = {
        show_buffer_close_icons = false,
        close_command = function(n)
          require('mini.bufremove').delete(n, false)
        end,
        show_close_icon = false,
        diagnostics = 'nvim_lsp',
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    enabled = false,
    opts = {
      options = {
        -- theme = 'catppuccin',
        theme = 'kanagawa',
        component_separators = ' ',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },

        lualine_c = {
          {
            'diagnostics',
            symbols = {
              error = '󰀩 ',
              warn = ' ',
              info = ' ',
              hint = '󱠂 ',
            },
          },
        },
        lualine_x = {
          {},
        },
        lualine_y = {
          { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
          { 'filename', separator = '', path = 1, padding = { left = 1, right = 1 } },
        },
        lualine_z = {
          { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
          { 'location', padding = { left = 0, right = 1 } },
        },
      },
      extensions = { 'neo-tree', 'lazy' },
    },
  },
}
