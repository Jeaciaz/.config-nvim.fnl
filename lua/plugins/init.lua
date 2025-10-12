-- :fennel:1755517444
local function _1_()
  return require("live-rename").rename({insert = true})
end
local function _2_()
  return require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook
end
return {{"nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons"}, {"williamboman/mason.nvim", tag = "stable", config = true, lazy = false}, {"saecki/live-rename.nvim", keys = {{"<Leader>r", _1_}}}, {"windwp/nvim-ts-autotag", opts = {enable_close = true, enable_rename = true, enable_close_on_slash = true}}, {"windwp/nvim-autopairs", event = "InsertEnter", opts = {disable_filetype = {"TelescopePrompt", "vim"}}}, "kyazdani42/nvim-web-devicons", {"supermaven-inc/supermaven-nvim", opts = {keymaps = {accept_suggestion = "<D-l>", accept_word = "<D-;>"}}, lazy = false}, {"marilari88/twoslash-queries.nvim", lazy = false}, {"JoosepAlviste/nvim-ts-context-commentstring", opts = {}}, {"numToStr/Comment.nvim", config = _2_}, {"akinsho/git-conflict.nvim", version = "*", config = true, lazy = false}}