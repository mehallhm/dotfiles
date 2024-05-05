return {
  {
    'SmiteshP/nvim-navic',
    enabled = false,
    dependencies = {
      'neovim/nvim-lspconfig',
    },
    opts = {
      lsp = {
        auto_attach = true,
      },
    },
    config = function()
      vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    end,
  },
}
