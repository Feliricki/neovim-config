return {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
        settings = {
            tsserver_file_preferences = {
                includeInlayParameterNameHints = "all",
                -- includeCompletionsForModuleExports = true,
                -- quotePreference = "auto",
            },
            jsx_close_tag = {
                enable = true, -- this is false by default
                filetypes = { "javascriptreact" , "typescriptreact" }
            }
        }
    }
}
