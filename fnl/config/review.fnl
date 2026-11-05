(local maps (require :config.maps))

(fn git-root []
  (vim.fs.root 0 :.git))

(fn run-git [root args]
  (let [command [:git :-C root]]
    (each [_ arg (ipairs args)]
      (table.insert command arg))
    (let [result (: (vim.system command {:text true}) :wait)]
      (if (= result.code 0)
          result.stdout
          (error result.stderr)))))

(fn tracked-changes [root]
  (let [tokens (vim.split (run-git root
                                   [:diff
                                    :--name-status
                                    :-z
                                    :--find-renames
                                    :HEAD]) "\000"
                          {:plain true :trimempty true})
        entries []]
    (var index 1)
    (while (<= index (length tokens))
      (let [status (. tokens index)
            renamed? (not= nil (string.match status "^[RC]"))
            source-path (and renamed? (. tokens (+ index 1)))
            path (. tokens (+ index (if renamed? 2 1)))]
        (table.insert entries {:filename (vim.fs.joinpath root path)
                               :lnum 1
                               :col 1
                               :text (if source-path
                                         (string.format "%s %s" status
                                                        source-path)
                                         status)})
        (set index (+ index (if renamed? 3 2)))))
    entries))

(fn untracked-changes [root]
  (let [paths (vim.split (run-git root
                                  [:ls-files :--others :--exclude-standard :-z])
                         "\000" {:plain true :trimempty true})]
    (icollect [_ path (ipairs paths)]
      {:filename (vim.fs.joinpath root path) :lnum 1 :col 1 :text "??"})))

(fn refresh! []
  (let [root (git-root)]
    (if (not root)
        (vim.notify "Review requires a Git worktree" vim.log.levels.WARN)
        (let [(ok entries) (pcall tracked-changes root)]
          (if (not ok)
              (vim.notify entries vim.log.levels.ERROR)
              (let [(untracked-ok untracked) (pcall untracked-changes root)]
                (when untracked-ok
                  (each [_ entry (ipairs untracked)]
                    (table.insert entries entry)))
                (table.sort entries #(< $1.filename $2.filename))
                (vim.fn.setqflist [] :r
                                  {:context {:base :HEAD : root}
                                   :items entries
                                   :title "Worktree vs HEAD"})
                (if (= (length entries) 0)
                    (do
                      (vim.cmd.cclose)
                      (vim.notify "Worktree clean"))
                    (vim.cmd.copen))))))))

(fn hide-current! []
  (let [list (vim.fn.getqflist {:all 1})]
    (when (> (length list.items) 0)
      (table.remove list.items list.idx)
      (vim.fn.setqflist [] :r {:context list.context
                               :idx (math.min list.idx (length list.items))
                               :items list.items
                               :title list.title})
      (when (= (length list.items) 0)
        (vim.cmd.cclose)))))

(fn copy-reference! [visual?]
  (let [file (vim.api.nvim_buf_get_name 0)]
    (if (= file "")
        (vim.notify "Buffer has no file path" vim.log.levels.WARN)
        (let [root (vim.fs.root file :.git)
              path (or (and root (vim.fs.relpath root file)) file)
              start-line (if visual?
                             (. (vim.api.nvim_buf_get_mark 0 "<") 1)
                             (. (vim.api.nvim_win_get_cursor 0) 1))
              end-line (if visual?
                           (. (vim.api.nvim_buf_get_mark 0 ">") 1)
                           start-line)
              first-line (math.min start-line end-line)
              last-line (math.max start-line end-line)
              reference (if (= first-line last-line)
                            (string.format "%s:%d" path first-line)
                            (string.format "%s:%d-%d" path first-line last-line))]
          (vim.fn.setreg "+" reference)
          (vim.notify (.. "Copied " reference))))))

(vim.api.nvim_create_autocmd :FileType
                             {:pattern :qf
                              :callback (fn [event]
                                          (vim.keymap.set :n :dd hide-current!
                                                          {:buffer event.buf
                                                           :desc "Hide review entry"
                                                           :silent true}))})

(maps.record :n :dd "Hide review entry (quickfix)")

{:copy-reference copy-reference! :refresh refresh!}
