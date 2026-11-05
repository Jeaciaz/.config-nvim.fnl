(local entries [])

(fn normalize-modes [modes]
  (if (= (type modes) :table) modes [modes]))

(fn record! [modes lhs desc]
  (each [_ mode (ipairs (normalize-modes modes))]
    (let [key (.. mode "\000" lhs)
          found? (do
                   (var exists? false)
                   (each [_ entry (ipairs entries)]
                     (when (= entry.key key)
                       (set exists? true)))
                   exists?)]
      (when (not found?)
        (table.insert entries {: key : mode : lhs : desc})))))

(fn map! [modes lhs rhs desc ?opts]
  (let [opts (vim.tbl_extend :force {: desc :silent true} (or ?opts {}))]
    (vim.keymap.set modes lhs rhs opts)
    (record! modes lhs desc)))

(fn close-window! [window]
  (when (vim.api.nvim_win_is_valid window)
    (vim.api.nvim_win_close window true)))

(fn show! []
  (table.sort entries #(if (= $1.mode $2.mode)
                           (< $1.lhs $2.lhs)
                           (< $1.mode $2.mode)))
  (let [lines ["Mode  Key                 Action"
               "----  ------------------  ----------------------------------------"]]
    (each [_ entry (ipairs entries)]
      (table.insert lines (string.format "%-4s  %-18s  %s" entry.mode entry.lhs
                                         entry.desc)))
    (let [width (math.min 82 (- vim.o.columns 4))
          height (math.min (length lines) (- vim.o.lines 4))
          buffer (vim.api.nvim_create_buf false true)
          window (vim.api.nvim_open_win buffer true
                                        {:relative :editor
                                         :row (math.floor (/ (- vim.o.lines
                                                                height)
                                                             2))
                                         :col (math.floor (/ (- vim.o.columns
                                                                width)
                                                             2))
                                         : width
                                         : height
                                         :border :rounded
                                         :style :minimal
                                         :title " Custom keymaps "
                                         :title_pos :center})]
      (vim.api.nvim_buf_set_lines buffer 0 -1 false lines)
      (let [buffer-options (. vim.bo buffer)
            window-options (. vim.wo window)]
        (set buffer-options.modifiable false)
        (set buffer-options.bufhidden :wipe)
        (set buffer-options.filetype :keymap-help)
        (set window-options.cursorline true))
      (vim.keymap.set :n :q #(close-window! window) {: buffer :silent true})
      (vim.keymap.set :n :<Esc> #(close-window! window) {: buffer :silent true}))))

{:map map! :record record! :show show!}
