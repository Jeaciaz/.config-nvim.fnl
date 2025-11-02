-- :fennel:1761634976
local function _1_()
  return require("live-rename").rename({insert = true})
end
local function _2_()
  return require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook
end
local function _3_()
  vim.api.nvim_set_option_value("background", "dark", {})
  return vim.cmd.colorscheme("catppuccin")
end
local function _4_()
  vim.api.nvim_set_option_value("background", "light", {})
  return vim.cmd.colorscheme("rose-pine")
end
return {{"nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons"}, {"williamboman/mason.nvim", tag = "stable", config = true, lazy = false}, {"saecki/live-rename.nvim", keys = {{"<Leader>r", _1_}}}, {"windwp/nvim-ts-autotag", opts = {opts = {enable_close = true, enable_rename = true, enable_close_on_slash = true}}}, {"windwp/nvim-autopairs", event = "InsertEnter", opts = {disable_filetype = {"TelescopePrompt", "vim"}}}, "kyazdani42/nvim-web-devicons", {"supermaven-inc/supermaven-nvim", opts = {keymaps = {accept_suggestion = "<C-l>", accept_word = "<C-;>"}}, lazy = false}, {"marilari88/twoslash-queries.nvim", lazy = false}, {"JoosepAlviste/nvim-ts-context-commentstring", opts = {}}, {"numToStr/Comment.nvim", config = _2_}, {"akinsho/git-conflict.nvim", version = "*", config = true, lazy = false}, {"brenoprata10/nvim-highlight-colors", opts = {}, lazy = false}, {"f-person/auto-dark-mode.nvim", opts = {set_dark_mode = _3_, set_light_mode = _4_, update_interval = 500}, lazy = false}}