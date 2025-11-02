{1 :catppuccin/nvim
 :lazy false
 :name :catppuccin
 :config (fn []
           (let [catppuccin (require :catppuccin)]
             (catppuccin.setup {:flavour :frappe
                                :no_italic true
                                :custom_highlights (fn [colors]
                                                     (let [dimmedText {:fg colors.overlay1}
                                                           toplevelDeclaration {:fg colors.yellow}
                                                           nestedDeclaration {:fg colors.blue}
                                                           boldText {:fg colors.text
                                                                     :style {1 :bold}}
                                                           controlFlow {:fg colors.peach}
                                                           primitiveValue {:fg colors.green}
                                                           text {:fg colors.text}]
                                                       {:Include text
                                                        :Keyword boldText
                                                        :Type text
                                                        :Conditional boldText
                                                        :Constant text
                                                        :Exception boldText
                                                        :Number primitiveValue
                                                        :Float primitiveValue
                                                        :Boolean primitiveValue
                                                        :Special boldText
                                                        :Function text
                                                        :DiagnosticUnnecessary dimmedText
                                                        (.. "@"
                                                             :punctuation.bracket) dimmedText
                                                        (.. "@"
                                                             :constant.builtin) primitiveValue
                                                        (.. "@" :comment) {:fg colors.mauve}
                                                        (.. "@" :type.builtin) text
                                                        (.. "@" :type.function) text
                                                        (.. "@" :function) text
                                                        (.. "@" :function.call) text
                                                        (.. "@"
                                                             :function.method.call) text
                                                        (.. "@"
                                                             :variable.parameter) text
                                                        (.. "@"
                                                             :variable.member) text
                                                        (.. "@"
                                                             :variable.builtin) text
                                                        (.. "@"
                                                             :lsp.type.property) text
                                                        (.. "@"
                                                             :lsp.type.enumMember) text
                                                        (.. "@"
                                                             :lsp.type.namespace) text
                                                        (.. "@"
                                                             :property.graphql) toplevelDeclaration
                                                        (.. "@"
                                                             :attribute.graphql) text
                                                        (.. "@"
                                                             :property.graphql) text
                                                        (.. "@"
                                                             :keyword.function) boldText
                                                        (.. "@"
                                                             :keyword.return) controlFlow
                                                        (.. "@"
                                                             :keyword.export) boldText
                                                        (.. "@"
                                                             :keyword.operator) boldText
                                                        (.. "@" :tag) text
                                                        (.. "@" :tag.builtin) text
                                                        (.. "@" :tag.attribute) text
                                                        (.. "@" :tag.delimiter) dimmedText
                                                        ;; My custom highlights:
                                                        (.. "@" :jsx_text) primitiveValue
                                                        (.. "@"
                                                             :jsx_interpolation_bracket) boldText
                                                        (.. "@"
                                                             :toplevel-declaration) toplevelDeclaration
                                                        (.. "@"
                                                             :parameter-decl) nestedDeclaration
                                                        (.. "@"
                                                             :punctuation-arrow) dimmedText
                                                        (.. "@"
                                                             :import-statement) dimmedText}))})
             (vim.cmd.colorscheme :catppuccin)))}
