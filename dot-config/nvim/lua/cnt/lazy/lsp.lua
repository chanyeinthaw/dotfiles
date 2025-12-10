return {
  { -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { "j-hui/fidget.nvim", opts = {} },

      -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
      -- ~~used for completion, annotations and signatures of Neovim apis~~
      -- used lazydev.nvim instead
      -- { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = lsp_attach_remaps,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        -- gopls = {
        --   settings = {
        --     gopls = {
        --       ["ui.diagnostics.escape"] = true,
        --       ["ui.codelenses.gc_details"] = true,
        --     },
        --   },
        -- },
        -- pyright = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- tsserver = {},
        --
        -- emmet_ls = {
        -- 	capabilities = capabilities,
        -- 	filetypes = {
        -- 		"css",
        -- 		"eruby",
        -- 		"html",
        -- 		"javascript",
        -- 		"javascriptreact",
        -- 		"less",
        -- 		"sass",
        -- 		"scss",
        -- 		"svelte",
        -- 		"pug",
        -- 		"typescriptreact",
        -- 		"vue",
        -- 	},
        -- 	init_options = {
        -- 		html = {
        -- 			options = {
        -- 				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        -- 				["bem.enabled"] = true,
        -- 			},
        -- 		},
        -- 	},
        -- },
        --
        -- biome = {},

        templ = {},
        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                  "vim",
                  "require",
                },
              },
              completion = {
                callSnippet = "Replace",
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false, -- optional, avoids prompts
              },
            },
          },
        },
      }

      -- -- configure Swift server
      -- ["sourcekit"] = function()
      -- 	lspconfig["sourcekit"].setup({
      -- capabilities = capabilities,
      -- 		-- filetypes = { "swift" },
      -- 	})
      -- end,

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu.
      require("mason").setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua", -- Used to format Lua code
        "lua-language-server",

        -- "biome",
        -- "prettier",
        -- "eslint-lsp",
        --
        -- "jq",
        -- "json-lsp",
        -- "yaml-language-server",
        --
        -- "intelephense",
        -- "php-cs-fixer",
        -- "phpcs",
        --
        -- "terraform-ls",
      })

      vim.lsp.config("pylsp", {
        capabilities = capabilities,
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                maxLineLength = 120,
              },
            },
          },
        },
      })

      vim.lsp.config("sourcekit", {
        cmd = { "xcrun", "sourcekit-lsp" },
        capabilities = capabilities,
        filetypes = { "swift", "objective-c", "objective-cpp" },
      })
      vim.lsp.enable({ "sourcekit" })

      vim.lsp.config("gopls", {
        capabilities = capabilities,
        filetypes = { "go", "gomod" },
        settings = {
          gopls = {
            ["ui.codelenses"] = {
              generate = true,
              gc_details = true,
            },
            ["ui.diagnostic.annotations"] = {
              escape = true,
            },
          },
        },
      })
      vim.lsp.enable({ "gopls" })

      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      ---@diagnostic disable-next-line: missing-fields
      require("mason-lspconfig").setup({
        -- ensure_installed = {},
        -- automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })
    end,
  },
}
