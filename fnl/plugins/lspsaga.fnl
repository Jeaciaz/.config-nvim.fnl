{1 :nvimdev/lspsaga.nvim
 :lazy false
 :opts {:ui {:winblend 10 :border :rounded}
        :code_action {:show_server_name true}
        :lightbulb {:enable false :enable_in_insert false}}
 :keys [;; diagnostic
        [:<C-j> "<Cmd>Lspsaga diagnostic_jump_next<CR>"]
        ;; hover
        [:K "<Cmd>Lspsaga hover_doc<CR>"]
        ;;code action
        [:<Leader>ca (fn [] (: (require :lspsaga.codeaction) :code_action))]]}
