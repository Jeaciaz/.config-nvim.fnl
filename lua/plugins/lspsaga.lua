-- :fennel:1760962089
local function _1_()
  return require("lspsaga.codeaction"):code_action()
end
return {"nvimdev/lspsaga.nvim", opts = {ui = {winblend = 10, border = "rounded"}, code_action = {show_server_name = true}, lightbulb = {enable = false, enable_in_insert = false}}, keys = {{"<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>"}, {"K", "<Cmd>Lspsaga hover_doc<CR>"}, {"<Leader>ca", _1_}}, lazy = false}