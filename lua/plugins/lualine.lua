-- :fennel:1760858159
local function search_result()
  if (vim.v.hlsearch == 0) then
    return ""
  else
  end
  local last_search = vim.fn.getreg("/")
  if (not last_search or (last_search == "")) then
    return ""
  else
  end
  local searchcount = vim.fn.searchcount({maxcount = 9999})
  return (last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")")
end
local function modified()
  if vim.bo.modified then
    return "+"
  elseif (not vim.bo.modifiable or vim.bo.readonly) then
    return "-"
  else
    return ""
  end
end
local function _4_()
  return vim.wo.previewwindow
end
local function _5_()
  return vim.bo.readonly
end
local function _6_()
  return (vim.bo.buftype == "quickfix")
end
return {"nvim-lualine/lualine.nvim", opts = {theme = "palenight", sections = {lualine_a = {"mode"}, lualine_b = {"branch", "diff", {"diagnostics", source = {"nvim"}, sections = {"error"}}, {"diangostics", source = {"nvim"}, sections = {"warn"}}, {"filename", path = 1, file_status = false}, {modified, color = {bg = "#7C343F"}}, {"%w", cond = _4_}, {"%r", cond = _5_}, {"%q", cond = _6_}}, lualine_c = {}, lualine_x = {}, lualine_y = {search_result, "filetype"}, lualine_z = {"%l:%c", "%p%%/%L"}}}, dependencies = {"nvim-tree/nvim-web-devicons"}, lazy = false}