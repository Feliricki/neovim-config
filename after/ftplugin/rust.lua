-- local lsp_zero = require('lsp-zero')
--
-- lsp_zero.on_attach(function(client, bufnr)
--   lsp_zero.default_keymaps({buffer = bufnr})
-- end)


require 'lspconfig'.rust_analyzer.setup({
    on_attach = function(client, bufnr)
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
})
