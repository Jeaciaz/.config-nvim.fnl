-- :fennel:1755506698
local function fmt()
  local conform = require("conform")
  return conform.format({bufnr = vim.api.nvim_get_current_buf(), lsp_format = "first"})
end
return {"stevearc/conform.nvim", opts = {formatters_by_ft = {javascript = {"eslint", "prettierd"}, typescript = {"eslint", "prettierd"}, typescriptreact = {"eslint", "prettierd"}, lua = {"lua-format"}, fennel = {"fnlfmt"}, sql = {"sqlfmt"}}}, keys = {{"<leader>ff", fmt}}}