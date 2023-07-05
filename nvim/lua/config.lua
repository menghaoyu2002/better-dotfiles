-- Configure plugins
vim.opt.termguicolors = true
require("nvim-tree").setup()
vim.api.nvim_create_autocmd({"QuitPre"}, {
    callback = function() vim.cmd("NvimTreeClose") end,
})
require("bufferline").setup {}
require('lualine').setup()
local navic = require("nvim-navic")
navic.setup {
    icons = {
        File          = "󰈙 ",
        Module        = " ",
        Namespace     = "󰌗 ",
        Package       = " ",
        Class         = "󰌗 ",
        Method        = "󰆧 ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = "󰕘",
        Interface     = "󰕘",
        Function      = "󰊕 ",
        Variable      = "󰆧 ",
        Constant      = "󰏿 ",
        String        = "󰀬 ",
        Number        = "󰎠 ",
        Boolean       = "◩ ",
        Array         = "󰅪 ",
        Object        = "󰅩 ",
        Key           = "󰌋 ",
        Null          = "󰟢 ",
        EnumMember    = " ",
        Struct        = "󰌗 ",
        Event         = " ",
        Operator      = "󰆕 ",
        TypeParameter = "󰊄 ",
    },
    lsp = {
        auto_attach = true
    }
}

require("lualine").setup({
    sections = {
        lualine_c = {
            "navic",

            -- Component specific options
            color_correction = nil, -- Can be nil, "static" or "dynamic". This option is useful only when you have highlights enabled.
                                    -- Many colorschemes don't define same backgroud for nvim-navic as their lualine statusline backgroud.
                                    -- Setting it to "static" will perform a adjustment once when the component is being setup. This should
                                    --   be enough when the lualine section isn't changing colors based on the mode.
                                    -- Setting it to "dynamic" will keep updating the highlights according to the current modes colors for
                                    --   the current section.

            navic_opts = nil  -- lua table with same format as setup's option. All options except "lsp" options take effect when set here.
        }
    },
})

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
        action = 'Telescope find_files',
        key = 'f',
      },
    },
  }
})

require("nvim-autopairs").setup {}
require("flash").setup {
    search = {
        mode = "regular"
    },
    modes = {
        char = {
            highlight = { backdrop = false }
        }
    }
}
vim.keymap.set('', 's', function()
    require("flash").jump()
end)
vim.keymap.set('', 'S', function()
    require("flash").treesitter()
end)
-- to use this, make sure to set `opts.modes.char.enabled = false`
-- local flashChar = require("flash.plugins.char")
-- local flashConfig = require("flash.config")
-- for _, motion in ipairs({ "f", "t", "F", "T" }) do
--   vim.keymap.set({ "n", "x", "o" }, motion, function()
--     require("flash").jump(flashConfig.get({
--       mode = "char",
--       search = {
--         mode = flashChar.mode(motion),
--         max_length = 1,
--       }
--     }, flashChar.motions[motion]))
--   end)
-- end

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

vim.g.coq_settings = {
  auto_start = 'shut-up',
  keymap = {
      jump_to_mark = ''
  }
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

