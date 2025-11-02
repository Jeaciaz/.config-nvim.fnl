-- :fennel:1760943044
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
  return snacks().picker.git_files[{untracked = true}]()
end
local function _4_()
  return snacks().picker.files({hidden = true, ignored = true})
end
local function _5_()
  return snacks().picker.git_grep({untracked = true})
end
local function _6_()
  return snacks().picker.grep_word()
end
local function _7_()
  return snacks().picker.buffers({focus = "list", sort_lastused = true})
end
local function _8_()
  return snacks().lazygit()
end
return {"folke/snacks.nvim", priority = 1000, opts = {dashboard = {enabled = true, example = "doom"}, gitbrowse = {enabled = true, what = "file", open = _1_}, picker = {enabled = true, formatters = {file = {filename_first = true}}, input = {keys = {Esc = {"close", mode = {"n", "i"}}}}}, lazygit = {configure = true}}, keys = {{"<Leader>gl", _2_}, {"<C-p>", _3_}, {"<C-P>", _4_}, {"<Leader>gg", _5_}, {"<Leader>gs", _6_}, {"<Leader>fb", _7_}, {"<Leader>lg", _8_}}, lazy = false}