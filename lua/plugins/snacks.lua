-- :fennel:1755533677
local function snacks()
  return require("snacks")
end
local function _1_(url)
  return vim.fn.setreg("+", url)
end
local function _2_()
  return snacks().gitbrowse.open()
end
local function _3_()
  return snacks().picker.git_files()
end
local function _4_()
  return snacks().picker.git_grep()
end
local function _5_()
  return snacks().picker.grep_word()
end
local function _6_()
  return snacks().picker.buffers({focus = "list"})
end
return {"folke/snacks.nvim", priority = 1000, opts = {dashboard = {enabled = true, example = "doom"}, gitbrowse = {enabled = true, what = "file", open = _1_}, picker = {enabled = true, formatters = {file = {filename_first = true}}, input = {keys = {Esc = {"close", mode = {"n", "i"}}}}}}, keys = {{"<Leader>gl", _2_}, {"<C-p>", _3_}, {"<Leader>gg", _4_}, {"<Leader>gs", _5_}, {"<Leader>fb", _6_}}, lazy = false}