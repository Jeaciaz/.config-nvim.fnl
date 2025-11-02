-- :fennel:1761725417
local function gen_c(color)
  return {fg = color, bg = color, blend = 5, inherit = false}
end
local _1_
do
  local toplevelDeclaration = gen_c("gold")
  local nestedDeclaration = gen_c("pine")
  local controlFlow = gen_c("rose")
  local primitiveValue = gen_c("leaf")
  local boldText = {fg = "text", bold = true, inherit = false}
  local text = {fg = "text", inherit = false}
  local dimmedText = {fg = "muted", bg = "none", inherit = false}
  _1_ = {Cursor = {bg = "leaf"}, Include = text, Keyword = boldText, Type = text, Conditional = boldText, Constant = text, Exception = boldText, Number = primitiveValue, Float = primitiveValue, Boolean = primitiveValue, String = primitiveValue, Special = boldText, Function = text, DiagnosticUnnecessary = dimmedText, [("@" .. "punctuation.bracket")] = dimmedText, [("@" .. "constant.builtin")] = primitiveValue, [("@" .. "comment")] = gen_c("iris"), [("@" .. "type")] = text, [("@" .. "type.builtin")] = text, [("@" .. "type.function")] = text, [("@" .. "function")] = text, [("@" .. "function.call")] = text, [("@" .. "function.method.call")] = text, [("@" .. "function.method")] = text, [("@" .. "variable.parameter")] = text, [("@" .. "variable.member")] = text, [("@" .. "variable.builtin")] = text, [("@" .. "lsp.type.property")] = text, [("@" .. "lsp.type.enumMember")] = text, [("@" .. "lsp.type.namespace")] = text, [("@" .. "lsp.type.parameter")] = text, [("@" .. "property.graphql")] = toplevelDeclaration, [("@" .. "attribute.graphql")] = text, [("@" .. "property.graphql")] = text, [("@" .. "keyword.function")] = boldText, [("@" .. "keyword.return")] = controlFlow, [("@" .. "keyword.export")] = boldText, [("@" .. "keyword.operator")] = boldText, [("@" .. "tag")] = text, [("@" .. "tag.builtin")] = text, [("@" .. "tag.attribute")] = text, [("@" .. "tag.delimiter")] = dimmedText, [("@" .. "jsx_text")] = primitiveValue, [("@" .. "jsx_interpolation_bracket")] = boldText, [("@" .. "toplevel-declaration")] = toplevelDeclaration, [("@" .. "parameter-decl")] = nestedDeclaration, [("@" .. "punctuation-arrow")] = dimmedText, [("@" .. "import-statement")] = dimmedText}
end
return {"rose-pine/neovim", name = "rose-pine", opts = {variant = "dawn", styles = {italic = false}, highlight_groups = _1_}, lazy = false}