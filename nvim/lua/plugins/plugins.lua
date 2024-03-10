return {
    "RRethy/vim-illuminate",
    {
        "lewis6991/gitsigns.nvim",
        config = true,
    },
    {
        "numToStr/Comment.nvim",
        config = true,
        keys = {
            {
                "<C-/>",
                function()
                    require("Comment.api").toggle.linewise.current()
                end,
                mode = { "n", "i" },
            },
            {
                "<C-/>",
                function()
                    local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
                    vim.api.nvim_feedkeys(esc, "nx", false)
                    require("Comment.api").toggle.linewise(vim.fn.visualmode())
                end,
                mode = { "x", "v" },
            },
        },
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    {
        "williamboman/mason.nvim",
        config = true,
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VimEnter",
        keys = {
            {
                "<C-P>",
                function() require("telescope.builtin").find_files({}) end,
                "Find Files",
            },
            {
                "<leader>fg",
                function() require("telescope.builtin").live_grep({}) end,
                "Live Grep",
            },
            { "<leader>fb", "<cmd>Telescope buffers<cr>" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
            { "<leader>ft", "<cmd>Telescope treesitter<cr>" },
            { "<leader>fs", "<cmd>Telescope spell_suggest<cr>" },
            { "<leader>gs", "<cmd>Telescope git_status<cr>" },
            { "<leader>gc", "<cmd>Telescope git_commits<cr>" },
            { "<leader>gb", "<cmd>Telescope git_bcommits<cr>" },
        },
        opts = {
            defaults = {
                layout_config = {
                    prompt_position = "top",
                },
                sorting_strategy = "ascending",
            },
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
                    layout_config = {
                        height = 0.70,
                    },
                },
            },
        },
        config = true,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                    --
                    -- -- Buffer local mappings.
                    -- -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set("n", "<space>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
                    -- vim.keymap.set({ 'n', 'i', 'v', 's' }, '<C-s>', function()
                    --     vim.lsp.buf.format { async = true }
                    -- end, opts)
                end,
            })

            local servers = {
                "lua_ls",
                "gopls",
                "tsserver",
                "cssls",
                "html",
                "clangd",
                "jsonls",
                "rust_analyzer",
                "eslint",
                "zls",
                "hls",
                "tailwindcss",
            }
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            for _, lsp in ipairs(servers) do
                require("lspconfig")[lsp].setup({
                    capabilities = capabilities,
                })
            end

            -- clangd override to use correct offset encoding
            require("lspconfig").clangd.setup({
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--offset-encoding=utf-16",
                },
            })
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<CR>",
                        scope_incremental = "<CR>",
                        node_incremental = "<TAB>",
                        node_decremental = "<S-TAB>",
                    },
                },
                ensure_installed = { "rust", "typescript", "javascript", "c", "go", "json" },
                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,
                autotag = {
                    enable = true,
                    enable_rename = true,
                    enable_close = true,
                    enable_close_on_slash = true,
                },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    },
    {
        "nvimdev/lspsaga.nvim",
        config = true,
        keys = {
            { "K",         ":Lspsaga hover_doc<CR>" },
            { "<leader>k", ":Lspsaga peek_definition<CR>" },
            { "<A-r>",     ":Lspsaga rename<CR>" },
            { "<A-o>",     ":Lspsaga outline<CR>" },
            { "<C-A-,>",   ":Lspsaga show_workspace_diagnostics<CR>" },
            { "<C-,>",     ":Lspsaga show_buf_diagnostics<CR>" },
            { "]d",        ":Lspsaga diagnostic_jump_next<CR>" },
            { "[d",        ":Lspsaga diagnostic_jump_prev<cr>" },
            { "<C-.>",     ":Lspsaga code_action<cr>" },
            { "<A-f>",     ":Lspsaga finder<cr>" },
            { "<leader>t", ":Lspsaga term_toggle<cr>" },
        },
        opts = {
            lightbulb = {
                enable = false,
                sign = false,
                virtual_text = true,
            },
            ui = {
                code_action = " ",
            },
        },
    },
    { "windwp/nvim-ts-autotag", config = true },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        config = function()
            local luasnip = require("luasnip")
            local cmp = require("cmp")
            local cmp_kinds = {
                Text = "󰉿 ",
                Method = "󰆧 ",
                Function = "󰊕 ",
                Constructor = " ",
                Field = "󰜢 ",
                Variable = "󰀫 ",
                Class = "󰠱 ",
                Interface = " ",
                Module = " ",
                Property = "󰜢 ",
                Unit = "󰑭 ",
                Value = "󰎠 ",
                Enum = " ",
                Keyword = "󰌋 ",
                Snippet = " ",
                Color = "󰏘 ",
                File = "  ",
                Reference = "󰈇 ",
                Folder = "  ",
                EnumMember = " ",
                Constant = "󰏿 ",
                Struct = "󰙅 ",
                Event = " ",
                Operator = "󰆕 ",
                TypeParameter = " ",
            }

            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<C-]>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                            -- they way you will only jump inside the snippet region
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<C-[>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- For luasnip users.
                }, {
                    { name = "buffer" },
                }),
            })

            -- Set configuration for specific filetype.
            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({
                    { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
                }, {
                    { name = "buffer" },
                }),
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })

            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
    },
    {
        "folke/flash.nvim",
        config = true,
        keys = {
            {
                "s",
                function()
                    require("flash").jump()
                end,
            },
            {
                "S",
                function()
                    require("flash").treesitter()
                end,
            },
        },
        opts = {
            search = {
                mode = "search",
            },
            label = {
                uppercase = false,
            },
            modes = {
                search = {
                    enabled = false,
                },
                char = {
                    highlight = { backdrop = false },
                },
                treesitter = {
                    label = {
                        rainbow = {
                            enabled = true,
                            shade = 1,
                        },
                    },
                },
            },
        },
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = true,
    },
    {
        "nvimdev/guard.nvim",
        dependencies = {
            "nvimdev/guard-collection",
        },
        keys = {
            { "<c-s>", "<cmd>GuardFmt<CR>" },
            { "<c-s>", "<ESC><cmd>GuardFmt<CR>", mode = "i" },
            { "<c-s>", "<ESC><cmd>GuardFmt<CR>", mode = "v" },
        },
        config = function()
            local ft = require("guard.filetype")

            ft("typescript,javascript,typescriptreact,graphql"):fmt("prettier")
            ft("lua"):fmt("lsp"):append("stylua"):append("selene")
            ft("go"):fmt("gofmt")
            ft("sql"):fmt("sql-formatter")
            ft("*"):lint("codespell")
            require("guard").setup({
                -- Choose to format on every write to a buffer
                fmt_on_save = true,
                -- Use lsp if no formatter was defined for this filetype
                lsp_as_default_formatter = false,
            })
        end,
    },

    {
        "sindrets/diffview.nvim",
        config = true,
        keys = {
            { "<leader>do", ":DiffviewOpen<CR>" },
            { "<leader>dc", ":DiffviewClose<CR>" },
        },
    },
}
