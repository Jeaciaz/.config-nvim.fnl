(fn [modes lhs rhs] "defines vim keymap for modes in 'args'."
           (vim.keymap.set modes lhs rhs))
