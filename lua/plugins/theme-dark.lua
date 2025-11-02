-- :fennel:1761592762
local function _1_()
  local catppuccin = require("catppuccin")
  local function _2_(colors)
    local dimmedText = {fg = colors.overlay1}
    local toplevelDeclaration = {fg = colors.yellow}
    local nestedDeclaration = {fg = colors.blue}
    local boldText = {fg = colors.text, style = {"bold"}}
    local controlFlow = {fg = colors.peach}
    local primitiveValue = {fg = colors.green}
    local text = {fg = colors.text}
    return {Include = text, Keyword = boldText, Type = text, Conditional = boldText, Constant = text, Exception = boldText, Number = primitiveValue, Float = primitiveValue, Boolean = primitiveValue, Special = boldText, Function = text, DiagnosticUnnecessary = dimmedText, [("@" .. "punctuation.bracket")] = dimmedText, [("@" .. "constant.builtin")] = primitiveValue, [("@" .. "comment")] = {fg = colors.mauve}, [("@" .. "type.builtin")] = text, [("@" .. "type.function")] = text, [("@" .. "function")] = text, [("@" .. "function.call")] = text, [("@" .. "function.method.call")] = text, [("@" .. "variable.parameter")] = text, [("@" .. "variable.member")] = text, [("@" .. "variable.builtin")] = text, [("@" .. "lsp.type.property")] = text, [("@" .. "lsp.type.enumMember")] = text, [("@" .. "lsp.type.namespace")] = text, [("@" .. "property.graphql")] = toplevelDeclaration, [("@" .. "attribute.graphql")] = text, [("@" .. "property.graphql")] = text, [("@" .. "keyword.function")] = boldText, [("@" .. "keyword.return")] = controlFlow, [("@" .. "keyword.export")] = boldText, [("@" .. "keyword.operator")] = boldText, [("@" .. "tag")] = text, [("@" .. "tag.builtin")] = text, [("@" .. "tag.attribute")] = text, [("@" .. "tag.delimiter")] = dimmedText, [("@" .. "jsx_text")] = primitiveValue, [("@" .. "jsx_interpolation_bracket")] = boldText, [("@" .. "toplevel-declaration")] = toplevelDeclaration, [("@" .. "parameter-decl")] = nestedDeclaration, [("@" .. "punctuation-arrow")] = dimmedText, [("@" .. "import-statement")] = dimmedText}
  end
  catppuccin.setup({flavour = "frappe", no_italic = true, custom_highlights = _2_})
  return vim.cmd.colorscheme("catppuccin")
end
return {"catppuccin/nvim", name = "catppuccin", config = _1_, lazy = false}