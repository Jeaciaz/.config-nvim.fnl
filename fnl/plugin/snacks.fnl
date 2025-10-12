(fn snacks [] (require :snacks))
{1 :folke/snacks.nvim
 :priority 1000
 :lazy false
 :opts {:dashboard {:enabled true :example :doom}
        :gitbrowse {:enabled true
                    :what :file
                    :open (fn [url] (vim.fn.setreg "+" url))}
        :picker {:enabled true
                 :formatters {:file {:filename_first true}}
                 :input {:keys {:Esc {1 :close :mode [:n :i]}}}}}
 :keys [[:<Leader>gl
         (fn []
           ((. (snacks) :gitbrowse :open)))]
        [:<C-p>
         (fn []
           ((. (snacks) :picker :git_files)))]
        [:<Leader>gg
         (fn []
           ((. (snacks) :picker :git_grep)))]
        [:<Leader>gs
         (fn []
           ((. (snacks) :picker :grep_word)))]
        [:<Leader>fb
         (fn []
           ((. (snacks) :picker :buffers) {:focus :list :sort_lastused true}))]]}
