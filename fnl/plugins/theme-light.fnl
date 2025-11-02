; {
; 	_nc = "#f8f0e7",
; 	base = "#faf4ed",
; 	surface = "#fffaf3",
; 	overlay = "#f2e9e1",
; 	muted = "#9893a5",
; 	subtle = "#797593",
; 	text = "#464261",
; 	love = "#b4637a",
; 	gold = "#ea9d34",
; 	rose = "#d7827e",
; 	pine = "#286983",
; 	foam = "#56949f",
; 	iris = "#907aa9",
; 	leaf = "#6d8f89",
; 	highlight_low = "#f4ede8",
; 	highlight_med = "#dfdad9",
; 	highlight_high = "#cecacd",
; 	none = "NONE",
; }

(fn gen-c [color] {:fg color :bg color :blend 5 :inherit false})

{1 :rose-pine/neovim
 :lazy false
 :name :rose-pine
 :opts {:variant :dawn
        :styles {:italic false}
        :highlight_groups (let [toplevelDeclaration (gen-c :gold)
                                nestedDeclaration (gen-c :pine)
                                controlFlow (gen-c :rose)
                                primitiveValue (gen-c :leaf)
                                boldText {:fg :text :bold true :inherit false}
                                text {:fg :text :inherit false}
                                dimmedText {:fg :muted
                                            :bg :none
                                            :inherit false}]
                            {:Cursor {:bg :leaf}
                             :Include text
                             :Keyword boldText
                             :Type text
                             :Conditional boldText
                             :Constant text
                             :Exception boldText
                             :Number primitiveValue
                             :Float primitiveValue
                             :Boolean primitiveValue
                             :String primitiveValue
                             :Special boldText
                             :Function text
                             :DiagnosticUnnecessary dimmedText
                             (.. "@" :punctuation.bracket) dimmedText
                             (.. "@" :constant.builtin) primitiveValue
                             (.. "@" :comment) (gen-c :iris)
                             (.. "@" :type) text
                             (.. "@" :type.builtin) text
                             (.. "@" :type.function) text
                             (.. "@" :function) text
                             (.. "@" :function.call) text
                             (.. "@" :function.method.call) text
                             (.. "@" :function.method) text
                             (.. "@" :variable.parameter) text
                             (.. "@" :variable.member) text
                             (.. "@" :variable.builtin) text
                             (.. "@" :lsp.type.property) text
                             (.. "@" :lsp.type.enumMember) text
                             (.. "@" :lsp.type.namespace) text
                             (.. "@" :lsp.type.parameter) text
                             (.. "@" :property.graphql) toplevelDeclaration
                             (.. "@" :attribute.graphql) text
                             (.. "@" :property.graphql) text
                             (.. "@" :keyword.function) boldText
                             (.. "@" :keyword.return) controlFlow
                             (.. "@" :keyword.export) boldText
                             (.. "@" :keyword.operator) boldText
                             (.. "@" :tag) text
                             (.. "@" :tag.builtin) text
                             (.. "@" :tag.attribute) text
                             (.. "@" :tag.delimiter) dimmedText
                             ;; My custom highlights:
                             (.. "@" :jsx_text) primitiveValue
                             (.. "@" :jsx_interpolation_bracket) boldText
                             (.. "@" :toplevel-declaration) toplevelDeclaration
                             (.. "@" :parameter-decl) nestedDeclaration
                             (.. "@" :punctuation-arrow) dimmedText
                             (.. "@" :import-statement) dimmedText})}}
