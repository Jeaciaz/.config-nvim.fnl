-- :fennel:1762071960
local langs = {"bash", "css", "dockerfile", "graphql", "html", "javascript", "json", "lua", "nginx", "fennel", "sql", "tsx", "typescript", "yaml", "typescriptreact"}
local function setup_ts_21()
  local ts = require("nvim-treesitter")
  local autotag = require("nvim-ts-autotag")
  ts.install(langs)
  do
    local augid_1_ = vim.api.nvim_create_augroup("start-ts", {clear = true})
    local function _2_()
      return vim.treesitter.start()
    end
    vim.api.nvim_create_autocmd({"FileType"}, {callback = _2_, group = augid_1_, pattern = langs})
  end
  vim.opt["foldexpr"] = "v:lua.vim.treesitter.foldexpr()"
  vim.opt["indentexpr"] = "v:lua.require\"nvim-treesitter\".indentexpr()"
  return autotag.setup({opts = {auto_close_on_slash = true}})
end
return {{"nvim-treesitter/nvim-treesitter", branch = "main", build = ":TSUpdate", config = setup_ts_21, lazy = false}, {"nvim-treesitter/nvim-treesitter-context", opts = {enable = true, separator = "~", max_lines = 5, trim_scope = "inner"}, lazy = false}}