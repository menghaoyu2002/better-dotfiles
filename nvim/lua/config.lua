-- Configure plugins
require("nvim-tree").setup()
vim.opt.termguicolors = true
require("bufferline").setup {}
require('lualine').setup()
require("mason").setup()
require 'colorizer'.setup()
require('Comment').setup()
require('gitsigns').setup()
require('dashboard').setup({
  theme = 'hyper',
  config = {
    week_header = {
      enable = true,
    },
    shortcut = {
      { desc = '󰊳 update', group = '@property', action = 'lazy update', key = 'u' },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'files',
        group = 'label',
        action = 'telescope find_files',
        key = 'f',
      },
      {
        desc = ' apps',
        group = 'diagnostichint',
        action = 'telescope app',
        key = 'a',
      },
      {
        desc = ' dotfiles',
        group = 'number',
        action = 'telescope dotfiles',
        key = 'd',
      },
    },
  }
})
require("nvim-autopairs").setup {}
require("flash").setup()

require'nvim-treesitter.configs'.setup {
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

vim.keymap.set('', 's', function()
    require("flash").jump()
end)
vim.keymap.set('', 'S', function()
    require("flash").treesitter()
end)


vim.g.coq_settings = {
  auto_start = 'shut-up'
}

-- LSP setup
require 'lspconfig'.lua_ls.setup {}
require'lspconfig'.gopls.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.jsonls.setup{}
