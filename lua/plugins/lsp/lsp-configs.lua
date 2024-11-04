local servers =
    {
      "lua_ls",
      "clangd",
      "cmake",
      "rust_analyzer"
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
      for _,server in ipairs(servers) do
        lspconfig[server].setup({})
      end

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})

    end
  }
}
