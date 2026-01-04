return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- First, setup mason-lspconfig
    require("mason-lspconfig").setup({
      -- List LSP servers you want auto-installed
      ensure_installed = {
        "html",           -- HTML
        "cssls",          -- CSS
        "ts_ls",          -- TypeScript/JavaScript (replaces tsserver)
        "pyright",        -- Python
        "lua_ls",         -- Lua
      },
      -- Auto-install servers when you open a file that needs them
      automatic_installation = true,
    })

    -- Then, configure each LSP
    vim.lsp.config("html", {})
    vim.lsp.config("cssls", {})
    vim.lsp.config("ts_ls", {})
    vim.lsp.config("pyright", {})
    vim.lsp.config("lua_ls", {})
  end,
}
