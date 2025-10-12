-- :fennel:1755507073
local function _1_(bufnr, on_dir)
  local root_files = {"package.json", "tsconfig.json"}
  local fname = vim.api.nvim_buf_get_name(bufnr)
  return on_dir(vim.fs.find(root_files, {path = fname, upward = true})[1])
end
local function _2_(client, bufnr)
  local function _3_()
    return client:exec_cmd({command = "_typescript.organizeImports", arguments = {vim.fn.expand("%:p")}})
  end
  vim.keymap.set({"n"}, "<leader>fi", _3_, {silent = true})
  return vim.lsp.inlay_hint.enable(true)
end
return {cmd = {"typescript-language-server", "--stdio"}, filetypes = {"typescript", "typescriptreact", "javascript", "typescript.tsx"}, root_dir = _1_, on_attach = _2_, settings = {preferences = {includeInlayFunctionParametersTypeHints = true, includeInlayFunctionLikeReturnTypeHints = true, includeInlayEnumMemberValueHints = true}}}