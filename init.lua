require('config')
-- bootstrap lazy.nvim, LazyVim and your plugins
-- vim.opt.rtp:prepend("C:\\Users\\Felir\\AppData\\Local\\nvim\\lua\\lazy")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
-- print(lazypath)
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "plugins" }
})


vim.o.completeopt = "menu,noinsert,popup,fuzzy"

-- Custom Keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        -- NOTE:This event is an uknown variable
        -- local opts = {buffer = event.buf}
        -- vim.keymap.set('n', '<C-Space>', '<C-x><C-o>', opts)
        -- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', vim.opts)
        -- vim.keymap.set('n', '<C-q>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)

        -- vim.keymap.set('n', 'grt', '<cmd>lua vim.lsp.buf.type_definition()<cr>',
        -- opts) vim.keymap.set('n', 'grd', '<cmd>lua
        -- vim.lsp.buf.declaration()<cr>', opts)
    end,
})


-- Format On Save
-- vim.api.nvim_create_autocmd('LspAttach', {
--     callback = function(args)
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--
--         if client:supports_method('textDocument/formatting') then
--             vim.api.nvim_create_autocmd('BufWritePre', {
--                 buffer = args.buf,
--                 callback = function()
--                     vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
--                 end,
--             })
--         end
--     end,
-- })

-- Enable Inlay-hints
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufnr = args.buf ---@type number
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.supports_method('textDocument/inlayHint') then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            vim.keymap.set('n', '<leader>i', function()
                vim.lsp.inlay_hint.enable(
                    not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
                    { bufnr = bufnr }
                )
            end, { buffer = bufnr })
        end
    end,
})

-- Highlight a word under the cursor
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client:supports_method('textDocument/documentHighlight') then
            local autocmd = vim.api.nvim_create_autocmd
            local augroup = vim.api.nvim_create_augroup('lsp_highlight', { clear = false })

            vim.api.nvim_clear_autocmds({ buffer = bufnr, group = augroup })

            autocmd({ 'CursorHold' }, {
                group = augroup,
                buffer = args.buf,
                callback = vim.lsp.buf.document_highlight,
            })

            autocmd({ 'CursorMoved' }, {
                group = augroup,
                buffer = args.buf,
                callback = vim.lsp.buf.clear_references,
            })
        end
    end,
})

vim.g.python3_host_prog = 'C:\\Python311\\python.exe'
-- require("config.after")
