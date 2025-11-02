;; extends
((identifier) @variable
  (#lua-match? @variable "^[A-Z]")
  (#has-ancestor? @variable import_statement))

([(shorthand_property_identifier_pattern) @parameter-decl (#set! priority 150)
  (required_parameter pattern: (identifier) @parameter-decl (#set! priority 200))
  (optional_parameter pattern: (identifier) @parameter-decl (#set! priority 200))])

(variable_declarator name: (identifier) @parameter-decl (#set! priority 150))
((identifier) @parameter-decl (#set! priority 150)
              (#has-parent? @parameter-decl array_pattern)
              (#has-ancestor? @parameter-decl variable_declarator))
(function_declaration name: (identifier) @parameter-decl (#set! priority 150))

(program [(lexical_declaration 
             (variable_declarator name: (identifier) @toplevel-declaration (#set! priority 200)))
            (function_declaration name: (identifier) @toplevel-declaration (#set! priority 200))
            (type_alias_declaration name: (type_identifier) @toplevel-declaration (#set! priority 200))
            (interface_declaration name: (type_identifier) @toplevel-declaration (#set! priority 200))])

(class_declaration name: (type_identifier) @toplevel-declaration (#set! priority 200))

(export_statement declaration: [(lexical_declaration (variable_declarator name: (identifier) @toplevel-declaration (#set! priority 200)))
                                (function_declaration name: (identifier) @toplevel-declaration (#set! priority 200))
                                (type_alias_declaration name: (type_identifier) @toplevel-declaration (#set! priority 200))
                                (interface_declaration name: (type_identifier) @toplevel-declaration (#set! priority 200))])

(arrow_function "=>" @punctuation-arrow)

((import_statement) @import-statement (#set! priority 200))
