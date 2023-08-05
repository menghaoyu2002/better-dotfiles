-- Configure plugins
vim.opt.termguicolors = true
require("nvim-tree").setup()
vim.api.nvim_create_autocmd({ "QuitPre" }, {
    callback = function() vim.cmd("NvimTreeClose") end,
})
require("bufferline").setup {}
require('lualine').setup()
require("lualine").setup()
require('lspsaga').setup({})
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

require 'nvim-treesitter.configs'.setup {
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
local lspconfig = require('lspconfig')

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        --
        -- -- Buffer local mappings.
        -- -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<C-s>', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

local servers = { 'lua_ls', 'gopls', 'tsserver', 'cssls', 'html', 'clangd', 'jsonls', 'rust_analyzer' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup(require('coq').lsp_ensure_capabilities({
        -- on_attach = my_custom_on_attach,
    }))
end
