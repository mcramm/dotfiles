vim.opt.signcolumn = "yes"
vim.lsp.set_log_level("debug")
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function()
    vim.lsp.start {
      name = "rubocop",
      cmd = { "bundle", "exec", "rubocop", "--only-recognized-file-types", "--force-exclusion", "--except", "Lint/Debugger", "--lsp" },
    }
  end,
})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "ruby",
  callback = function()
    vim.lsp.buf.format()
  end,
})
