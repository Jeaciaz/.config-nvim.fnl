;; extends

(jsx_text) @jsx_text

(jsx_expression ["{" "}"] @jsx_interpolation_bracket 
  (#not-has-ancestor? @jsx_interpolation_bracket jsx_opening_element)
  (#not-has-ancestor? @jsx_interpolation_bracket jsx_self_closing_element))
