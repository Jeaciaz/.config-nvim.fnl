(fn search-result []
  (when (= vim.v.hlsearch 0) (lua "return \"\""))
  (local last-search (vim.fn.getreg "/"))
  (when (or (not last-search) (= last-search "")) (lua "return \"\""))
  (local searchcount (vim.fn.searchcount {:maxcount 9999}))
  (.. last-search "(" searchcount.current "/" searchcount.total ")"))

(fn modified []
  (if vim.bo.modified "+"
      (or (not vim.bo.modifiable) vim.bo.readonly) "-"
      ""))

{1 :nvim-lualine/lualine.nvim
 :opts {:theme :palenight
        :sections {:lualine_a [:mode]
                   :lualine_b [:branch
                               :diff
                               {1 :diagnostics
                                :source [:nvim]
                                :sections [:error]}
                               {1 :diangostics
                                :source [:nvim]
                                :sections [:warn]}
                               {1 :filename :file_status false :path 1}
                               {1 modified :color {:bg "#7C343F"}}
                               {1 "%w" :cond (fn [] vim.wo.previewwindow)}
                               {1 "%r" :cond (fn [] vim.bo.readonly)}
                               {1 "%q"
                                :cond (fn [] (= vim.bo.buftype :quickfix))}]
                   :lualine_c {}
                   :lualine_x {}
                   :lualine_y [search-result :filetype]
                   :lualine_z ["%l:%c" "%p%%/%L"]}}
 :dependencies [:nvim-tree/nvim-web-devicons]
 :lazy false}
