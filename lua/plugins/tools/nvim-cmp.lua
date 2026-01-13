return {
  {
    'hrsh7th/cmp-nvim-lsp',
  },
  {
      'L3MON4D3/LuaSnip',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    }
  },
  {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", --source for file system paths
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        view = {
          docs = {
            auto_open = false,
          }
        },
        mapping = cmp.mapping.preset.insert({
          ["<A-k>"] = cmp.mapping.select_prev_item(),
          ["<A-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<A-Space>"] = cmp.mapping.complete(), -- show completion suggestions
          ["<A-e>"] = cmp.mapping.abort(), -- close completion window
          ["<CR>"] = cmp.mapping.confirm({select = false}),
        }),
        -- sources for autocompletion
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
          { name = 'path'}
        }, {
            { name = 'buffer' },
          })
      })
    end,
  }
}
