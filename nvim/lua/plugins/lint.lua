return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    
    -- Configure which linters to use for each filetype
    lint.linters_by_ft = {
      html = { "htmlhint" },
      -- Add more: python = { "pylint" }, etc.
    }
    
    -- Auto-run linter when you save or enter a buffer
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
