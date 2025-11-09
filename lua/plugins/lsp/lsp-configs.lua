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
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      
      -- 设置较小的 updatetime 让 CursorHold 更快触发
      vim.o.updatetime = 250

      -- on_attach: 为支持 documentHighlight 的服务器设置高亮 autocmd
      local on_attach = function(client, bufnr)
        if client.server_capabilities.documentHighlightProvider then
          if client.server_capabilities.documentHighlightProvider then
            local group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = false })
            vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI"},{group = group, buffer = bufnr, callback = function() vim.lsp.buf.document_highlight() end,})
            vim.api.nvim_create_autocmd({ "CursorMoved", "BufLeave" }, {group = group,buffer = bufnr,callback = function() vim.lsp.buf.clear_references() end,})
          end
        end
      end

      for _,server in ipairs(servers) do
        vim.lsp.config[server] = {
          capabilities = capabilities,
          on_attach = on_attach,
        }
      end

      -- >>> Inlay Hints
      -- 默认开启Inlay Hints
      vim.keymap.set('n', '<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
      end, { desc = '[T]oggle Inlay [H]ints' })
      vim.lsp.inlay_hint.enable(true)
      -- <<< Inlay Hints

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
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
