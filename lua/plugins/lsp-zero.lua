--- Uncomment these if you want to manage LSP servers from neovim

return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    -- init = function()
    --   -- Disable automatic setup, we are doing it manually
    --   vim.g.lsp_zero_extend_cmp = 0
    --   vim.g.lsp_zero_extend_lspconfig = 0
    -- end,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      -- local cmp_action = lsp_zero.cmp_action()
      -- local cmp_select = { behavior = cmp.SelectBehavior.Select }
      cmp.setup({
        preselect = 'item',
        completion = {
          completeopt = 'menu, menuone, noinsert',
        },
        source = {
          { name = 'nvim-lsp' },
          { name = 'lua-snip' },
          { name = 'buffer' },
        },
        -- show the source of autocompletion
        -- local cmp_select = { behavior = cmp.SelectBehavior.Select }
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
          ['<C-n>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<C-Space>'] = cmp.mapping.complete(),
          
          -- ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          -- ['<C-d>'] = cmp.mapping.scroll_docs(4),
          -- ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          -- ['<C-b>'] = cmp_action.luasnip_jump_backward(),
          -- -- auto select the first option
          -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
          -- ['<Tab>'] = cmp_action.tab_complete(),
          -- ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),

        }),
      })
    end
  },
  -- Format configs
  {
    "lukas-reineke/lsp-format.nvim",
  },
  -- inlayhints
  {
    "lvimuser/lsp-inlayhints.nvim",
  },
  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },

    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason-lspconfig.nvim' },
      { "lukas-reineke/lsp-format.nvim" },
      -- { "lvimuser/lsp-inlayhints.nvim" }
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
        -- lsp_zero.default_setup({})
        -- if the client support formatting then the autoformat configs are applied
        if client.supports_method('textDocument/formatting') then
          require('lsp-format').on_attach(client)
        end
      end)
      -- example on setting up the lsp server for lua
      -- local lua_opts = lsp_zero.nvim_lua_ls()
      -- require('lspconfig').lua_ls.setup(lua_opts)
      local inlay_hints = require('lsp-inlayhints')
      inlay_hints = inlay_hints.setup();

      --[[ require('lsp-config') ]]
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls' },
        handlers = {
          lsp_zero.default_setup,
        }
      })
    end
  },
}
