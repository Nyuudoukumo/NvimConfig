local servers =
    {
      "lua_ls",
      "clangd",
      "rust_analyzer",
    }

return {
  {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end
  },
  {
    -- mason-lspconfig设置默认安装的语言服务器
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = servers
      })
    end
  },
  {
    -- nvim-lspconfig用来使neovim获取语言服务器的服务
    -- ":h vim.lsp.buf"来查看功能
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      for _,server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities
        })
      end
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})

      --使用悬浮窗口显示报错信息
      vim.keymap.set('n', '<leader>e', ":lua vim.diagnostic.open_float(nil,{focus=false})<CR>",{})
      vim.diagnostic.config({
        virtual_text = false
      })
--
--      -- Show line diagnostics automatically in hover window
--      vim.o.updatetime = 250
--      vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]


    end
  }
}
