[{1 :nvim-lualine/lualine.nvim :dependencies :nvim-tree/nvim-web-devicons}
 ;; LSP installer
 {1 :williamboman/mason.nvim :tag :stable :lazy false :config true}
 ;; rename symbol with preview
 {1 :saecki/live-rename.nvim
  :keys [[:<Leader>r
          (fn []
            ((. (require :live-rename) :rename) {:insert true}))]]}
 ;; autoclose HTML/JSX tags
 {1 :windwp/nvim-ts-autotag
  :opts {:enable_close true :enable_rename true :enable_close_on_slash true}}
 {1 :windwp/nvim-autopairs
  :event :InsertEnter
  :opts {:disable_filetype [:TelescopePrompt :vim]}}
 ;; icons
 :kyazdani42/nvim-web-devicons
 {1 :supermaven-inc/supermaven-nvim
  :lazy false
  :opts {:keymaps {:accept_suggestion :<D-l> :accept_word "<D-;>"}}}
 ;; // ^?
 {1 :marilari88/twoslash-queries.nvim :lazy false}
 {1 :JoosepAlviste/nvim-ts-context-commentstring :opts {}}
 {1 :numToStr/Comment.nvim
  :config (fn []
            (. (require :ts_context_commentstring.integrations.comment_nvim)
               :create_pre_hook))}
 {1 :akinsho/git-conflict.nvim :version "*" :config true :lazy false}]
