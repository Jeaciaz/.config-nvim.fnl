(fn [name] "sets vim colorscheme to 'name'."
           (vim.cmd (.. "colorscheme " name)))
