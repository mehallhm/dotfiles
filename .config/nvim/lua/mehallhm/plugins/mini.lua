return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      require('mini.pairs').setup()
      require('mini.bufremove').setup()
      require('mini.files').setup()
      vim.keymap.set('n', '<leader>f', '<cmd>lua MiniFiles.open()<CR>', { desc = '[F]iles' })
      vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>')
      vim.keymap.set('n', '<S-h>', '<cmd>bprev<cr>')

      require('mini.starter').setup()
      require('mini.move').setup()
      require('mini.comment').setup {
        options = {
          custom_commentstring = function()
            return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
          end,
        },
      }

      require('mini.statusline').setup()
      require('mini.tabline').setup()
    end,
  },
}
