-- just highlighting codes, but it's great.
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Install parsers for languages you use
      ensure_installed = { "lua",
                           "vim", 
                           "vimdoc", 
                           "markdown",
                           "html",
                           "css",
                           "python",
                           "javascript",
                           "typescript",
                           "tsx",
                       },
      
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
      
      highlight = {
        enable = true,
      },
    })
  end,
}
