return {
  'mbbill/undotree',

  config = function()
    vim.keymap.set('n', '<leader>wu', vim.cmd.UndotreeToggle, { desc = '[W]orkspace [U]ndotree' })
  end,
}
