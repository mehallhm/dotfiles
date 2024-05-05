return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    keys = {
      {
        '<leader>wnf',
        function()
          require('neo-tree.command').execute { toggle = true, dir = vim.uv.cwd() }
        end,
        desc = '[W]orkspace [N]eoTree [F]iles',
      },
      {
        '<leader>wnb',
        function()
          require('neo-tree.command').execute { toggle = true, source = 'buffers' }
        end,
        desc = '[W]orkspace [N]eoTree [B]uffers',
      },
      {
        '<leader>wns',
        function()
          require('neo-tree.command').execute { toggle = true, source = 'document_symbols' }
        end,
        desc = '[W]orkspace [N]eoTree [S]ymbols',
      },
      {
        '<leader>wng',
        function()
          require('neo-tree.command').execute { toggle = true, source = 'git_status' }
        end,
        desc = '[W]orkspace [N]eoTree [G]it',
      },
    },
    opts = {
      sources = { 'filesystem', 'buffers', 'git_status', 'document_symbols' },
      open_files_do_not_replace_types = { 'terminal', 'Trouble', 'trouble', 'qf', 'Outline' },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        width = 30,
      },
    },
  },
  { 'folke/neodev.nvim', opts = {} },
}
