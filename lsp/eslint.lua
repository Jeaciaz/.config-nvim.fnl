-- :fennel:1760858159
local lsp = vim.lsp
local function root_markers_with_field(root_files, new_names, field, fname)
  local path = vim.fn.fnamemodify(fname, ":h")
  local found = vim.fs.find(new_names, {path = path, upward = true})
  for _, f in ipairs((found or {})) do
    for line in io.lines(f) do
      if line:find(field) then
        root_files[(#root_files + 1)] = vim.fs.basename(f)
        break
      else
      end
    end
  end
  return root_files
end
local function insert_package_json(root_files, field, fname)
  return root_markers_with_field(root_files, {"package.json", "package.json5"}, field, fname)
end
local function _2_(_, config)
  local root_dir = config.root_dir
  if root_dir then
    config.settings = (config.settings or {})
    config.settings.workspaceFolder = {name = vim.fn.fnamemodify(root_dir, ":t"), uri = root_dir}
    local flat_config_files = {"eslint.config.js", "eslint.config.mjs", "eslint.config.cjs", "eslint.config.ts", "eslint.config.mts", "eslint.config.cts"}
    for _0, file in ipairs(flat_config_files) do
      if (vim.fn.filereadable((root_dir .. "/" .. file)) == 1) then
        config.settings.experimental = (config.settings.experimental or {})
        config.settings.experimental.useFlatConfig = true
        break
      else
      end
    end
    local pnp_cjs = (root_dir .. "/.pnp.cjs")
    local pnp_js = (root_dir .. "/.pnp.js")
    if (vim.uv.fs_stat(pnp_cjs) or vim.uv.fs_stat(pnp_js)) then
      local cmd = config.cmd
      config.cmd = vim.list_extend({"yarn", "exec"}, cmd)
      return nil
    else
      return nil
    end
  else
    return nil
  end
end
local function _6_(_, result)
  if not result then
    return 
  else
  end
  return 4
end
local function _8_()
  vim.notify("[lspconfig] Unable to find ESLint library.", vim.log.levels.WARN)
  return {}
end
local function _9_(_, result)
  if result then
    vim.ui.open(result.url)
  else
  end
  return {}
end
local function _11_()
  vim.notify("[lspconfig] ESLint probe failed.", vim.log.levels.WARN)
  return {}
end
local function _12_(client)
  local function _13_()
    local bufnr = vim.api.nvim_get_current_buf()
    return client:exec_cmd({arguments = {{uri = vim.uri_from_bufnr(bufnr), version = lsp.util.buf_versions[bufnr]}}, command = "eslint.applyAllFixes", title = "Fix all Eslint errors for current buffer"}, {bufnr = bufnr})
  end
  return vim.api.nvim_buf_create_user_command(0, "LspEslintFixAll", _13_, {})
end
local function _14_(bufnr, on_dir)
  local root_file_patterns = {".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json", "eslint.config.js", "eslint.config.mjs", "eslint.config.cjs", "eslint.config.ts", "eslint.config.mts", "eslint.config.cts"}
  local fname = vim.api.nvim_buf_get_name(bufnr)
  root_file_patterns = insert_package_json(root_file_patterns, "eslintConfig", fname)
  return on_dir(vim.fs.dirname(vim.fs.find(root_file_patterns, {path = fname, upward = true})[1]))
end
return {before_init = _2_, cmd = {"vscode-eslint-language-server", "--stdio"}, filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte", "astro"}, handlers = {["eslint/confirmESLintExecution"] = _6_, ["eslint/noLibrary"] = _8_, ["eslint/openDoc"] = _9_, ["eslint/probeFailed"] = _11_}, on_attach = _12_, root_dir = _14_, settings = {codeAction = {disableRuleComment = {enable = true, location = "separateLine"}, showDocumentation = {enable = true}}, codeActionOnSave = {mode = "all", enable = false}, experimental = {useFlatConfig = false}, format = true, nodePath = "", onIgnoredFiles = "off", packageManager = nil, problems = {shortenToSingleLine = false}, rulesCustomizations = {}, run = "onType", validate = "on", workingDirectory = {mode = "location"}, quiet = false, useESLintClass = false}, workspace_required = true}