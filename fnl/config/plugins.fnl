(local languages [:bash
                  :clojure
                  :css
                  :dockerfile
                  :fennel
                  :graphql
                  :html
                  :javascript
                  :json
                  :lua
                  :markdown
                  :markdown_inline
                  :nginx
                  :rust
                  :sql
                  :tsx
                  :typescript
                  :yaml])

((. (require :fzf-lua) :setup) {:defaults {:formatter :path.filename_first}
                                :keymap {:fzf {:ctrl-q :select-all+accept}}})

((. (require :nvim-autopairs) :setup) {:disable_filetype [:FzfLua
                                                          :TelescopePrompt
                                                          :vim]})

((. (require :nvim-ts-autotag) :setup) {:opts {:enable_close true
                                               :enable_close_on_slash true
                                               :enable_rename true}})

(fn start-treesitter! [buffer]
  (pcall vim.treesitter.start buffer)
  ;; Truthy autocmd callback results remove the autocmd.
  nil)

(vim.api.nvim_create_autocmd :FileType
                             {:pattern languages
                              :callback #(start-treesitter! $1.buf)})

(let [install-task ((. (require :nvim-treesitter) :install) languages)]
  (: install-task :await
     (fn [error]
       (when (not error)
         (vim.schedule (fn []
                         (each [_ buffer (ipairs (vim.api.nvim_list_bufs))]
                           (when (vim.tbl_contains languages
                                                   (. vim.bo buffer :filetype))
                             (start-treesitter! buffer)))))))))

((. (require :treesitter-context) :setup) {:enable true
                                           :max_lines 5
                                           :trim_scope :inner})

((. (require :git-conflict) :setup) {})

((. (require :gitsigns) :setup) {:current_line_blame true
                                 :current_line_blame_formatter "<author>, <author_time:%R> | <summary>"
                                 :current_line_blame_opts {:delay 500
                                                           :use_focus true
                                                           :virt_text true
                                                           :virt_text_pos :eol}})

((. (require :twoslash-queries) :setup) {:highlight :Type
                                         :is_enabled true
                                         :multi_line false})

(vim.api.nvim_create_autocmd :UIEnter
                             {:once true
                              :callback #((. (require :yazi) :setup) {:open_for_directories true
                                                                      :clipboard_register "+"
                                                                      :floating_window_border :rounded
                                                                      :floating_window_scaling_factor 0.92})})

((. (require :lualine) :setup) {:options {:component_separators ""
                                          :globalstatus true
                                          :section_separators ""
                                          :theme :cyberdream}
                                :sections {:lualine_a [:mode]
                                           :lualine_b [:branch
                                                       :diff
                                                       :diagnostics]
                                           :lualine_c [{1 :filename :path 1}]
                                           :lualine_x [{1 (fn [] "SPC ?  keys")
                                                        :color {:fg "#7b8496"}}
                                                       :filetype]
                                           :lualine_y [:progress]
                                           :lualine_z [:location]}})
