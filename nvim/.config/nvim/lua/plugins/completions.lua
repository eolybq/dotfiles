return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        'hrsh7th/cmp-cmdline',
        "R-nvim/cmp-r",
        -- 		"github/copilot.vim",
      },
    },
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 750,    max_item_count = 10 },
          { name = "luasnip",  max_item_count = 5 },
          { name = "buffer",   priority = 500,    keyword_length = 4, max_item_count = 8 },
          { name = "path",     keyword_length = 2 },
          { name = "codeium", priority = 1000 }
        }),
      })
        formatting = {
          format = function(entry, vim_item)
            -- Přidejte označení pro každý zdroj
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
              codeium = "[Codeium]",
            })[entry.source.name] or entry.source.name
            return vim_item
          end
        }

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    })

    end,
  },
}
