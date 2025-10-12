(fn [group {: fg : bg}] "sets hightlights"
  (vim.cmd (.. "hi " group " guifg=" fg " guibg=" bg)))
