-- :fennel:1755535654
local function _1_()
  return require("lspsaga.codeaction"):code_action()
end
return {"nvimdev/lspsaga.nvim", opts = {ui = {winblend = 10, border = "rounded"}, code_action = {show_server_name = true}, lightbulb = {enable = false, enable_in_insert = false}}, keys = {{"<Leader>d", "<Cmd>Lspsaga goto_definition<CR>"}, {"<Leader>D", "<Cmd>Lspsaga peek_definition<CR>"}, {"<Leader>t", "<Cmd>Lspsaga goto_type_definition<CR>"}, {"<Leader>T", "<Cmd>Lspsaga peek_type_definition<CR>"}, {"<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>"}, {"K", "<Cmd>Lspsaga hover_doc<CR>"}, {"<Leader>ca", _1_}}}