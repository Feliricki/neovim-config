return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")
      treesitter.setup({
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
        ensure_installed = {
          "json",
          "javascript",
          "typescript",
          "tsx",
          "yaml",
          "html",
          "css",
          "prisma",
          "markdown",
          "markdown_inline",
          "svelte",
          "graphql",
          "haskell",
          "c_sharp",
          "bash",
          "lua",
          "vim",
          "vimdoc",
          "dockerfile",
          "gitignore",
          "query",},
        sync_install = false
      })
    end,
  },
  {
    'nvim-treesitter/playground',
  },
}
