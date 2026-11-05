;; extends
((identifier) @variable
  (#lua-match? @variable "^[A-Z]")
  (#has-ancestor? @variable import_statement))

([(shorthand_property_identifier_pattern) @parameter-decl (#set! priority 150)
  (pair_pattern value: (identifier) @parameter-decl (#set! priority 200))
  (required_parameter pattern: (identifier) @parameter-decl (#set! priority 200))
  (optional_parameter pattern: (identifier) @parameter-decl (#set! priority 200))])

(variable_declarator name: (identifier) @parameter-decl (#set! priority 150))
((identifier) @parameter-decl (#set! priority 150)
              (#has-parent? @parameter-decl array_pattern rest_pattern)
              (#has-ancestor? @parameter-decl variable_declarator formal_parameters catch_clause))
(assignment_pattern left: (identifier) @parameter-decl (#set! priority 150))
(arrow_function parameter: (identifier) @parameter-decl (#set! priority 150))
(catch_clause parameter: (identifier) @parameter-decl (#set! priority 150))
(function_declaration name: (identifier) @parameter-decl (#set! priority 150))
(function_expression name: (identifier) @parameter-decl (#set! priority 150))
(generator_function_declaration name: (identifier) @parameter-decl (#set! priority 150))
(method_definition name: [(property_identifier) (private_property_identifier)] @parameter-decl (#set! priority 150))
(class_declaration name: (type_identifier) @parameter-decl (#set! priority 150))
(type_alias_declaration name: (type_identifier) @parameter-decl (#set! priority 150))
(interface_declaration name: (type_identifier) @parameter-decl (#set! priority 150))

(program [(lexical_declaration 
             (variable_declarator name: (identifier) @toplevel-declaration (#set! priority 200)))
            (function_declaration name: (identifier) @toplevel-declaration (#set! priority 200))
            (type_alias_declaration name: (type_identifier) @toplevel-declaration (#set! priority 200))
            (interface_declaration name: (type_identifier) @toplevel-declaration (#set! priority 200))])

(program (class_declaration name: (type_identifier) @toplevel-declaration (#set! priority 200)))
(program (generator_function_declaration name: (identifier) @toplevel-declaration (#set! priority 200)))

(export_statement declaration: [(lexical_declaration (variable_declarator name: (identifier) @toplevel-declaration (#set! priority 200)))
                                (function_declaration name: (identifier) @toplevel-declaration (#set! priority 200))
                                (type_alias_declaration name: (type_identifier) @toplevel-declaration (#set! priority 200))
                                (interface_declaration name: (type_identifier) @toplevel-declaration (#set! priority 200))
                                (class_declaration name: (type_identifier) @toplevel-declaration (#set! priority 200))
                                (generator_function_declaration name: (identifier) @toplevel-declaration (#set! priority 200))])

("export" @export-keyword (#set! priority 150))

(arrow_function "=>" @punctuation-arrow)

((import_statement) @import-statement (#set! priority 200))

;; Neutral type expressions, including literals and operators inside them.
;; Above LSP semantic tokens (125-127), below declaration accents (150-200).
([(type_identifier)
  (predefined_type)
  (type_annotation)
  (type_arguments)] @neutral-syntax
  (#set! priority 140))

(type_alias_declaration value: (_) @neutral-syntax
  (#set! priority 140))

("=" @neutral-syntax (#set! priority 140))
("readonly" @quiet-syntax (#set! priority 160))

;; Comments inside type expressions still retain their own style.
((comment) @comment (#set! priority 175))
