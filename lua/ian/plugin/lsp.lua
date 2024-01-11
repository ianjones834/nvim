local filetypes = {
  'lua',
  'cpp',
  'javascript',
  'typescript',
}

return {
  {
    "neovim/nvim-lspconfig",
    ft = filetypes,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = function()
          vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
          vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {buffer = 0})
          vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {buffer = 0})
          vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer = 0})
          vim.keymap.set("n", "[l", "<cmd>Telescope diagnostics<cr>", {buffer = 0})
        end,
        settings = {
          Lua = {
            diagnostics = {
              globals = {
                "vim",
              }
            }
          }
        }
      })

      lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = function()
          vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
          vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {buffer = 0})
          vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {buffer = 0})
          vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer = 0})
          vim.keymap.set("n", "[l", "<cmd>Telescope diagnostics<cr>", {buffer = 0})
        end,
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = function ()
          vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
          vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {buffer = 0})
          vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {buffer = 0})
          vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer = 0})
          vim.keymap.set("n", "[l", "<cmd>Telescope diagnostics<cr>", {buffer = 0})
        end,
        cmd = {
          "typescript-language-server",
          "--stdio",
        },
      })
    end,
    dependencies = {
      "hrsh7th/nvim-cmp"
    }
  },

  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    config = function()
      vim.opt.completeopt={"menu", "menuone", "noselect"}

      local cmp = require'cmp'

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-Space>'] = cmp.mapping.confirm({select = true}),
          ['<C-e>'] = cmp.mapping.abort(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
          { name = 'buffer' },
        })
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
          { name = 'buffer' },
        })
      })
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
    }
  }
}
