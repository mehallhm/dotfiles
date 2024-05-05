return {
  {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup {
        icons = false,
      }

      vim.keymap.set('n', '<leader>t', function()
        require('trouble').toggle()
      end, { desc = 'Toggle [T]rouble' })

      vim.keymap.set('n', ']t', function()
        require('trouble').next { skip_groups = true, jump = true }
      end, { desc = 'Next Trouble' })

      vim.keymap.set('n', '[t', function()
        require('trouble').previous { skip_groups = true, jump = true }
      end, { desc = 'Prev Trouble' })
    end,
  },
}
