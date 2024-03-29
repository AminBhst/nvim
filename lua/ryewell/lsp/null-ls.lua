local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    -- formatting.prettier.with { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }, ]]
    -- formatting.black.with { extra_args = { "--fast" } }, ]]
     formatting.astyle,
     --[[ formatting.dart_format ]]
   --  formatting.stylua,
    -- diagnostics.flake8,
  },
 -- on_attach = function(client, bufnr)
 --   local lsp_format_modifications = require"lsp-format-modifications" -- lsp-format-modifications related. removed becuase of not supporting formatters without range formatting
 --   lsp_format_modifications.attach(client, bufnr, { format_on_save = false })
 -- end
}
