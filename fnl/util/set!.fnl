(fn [name val]
  "sets variable 'name' to 'val' and returns its value."
  (set (. vim.o name) (if (= nil val) true val)))
