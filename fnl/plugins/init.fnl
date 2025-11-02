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
  :opts {:opts {:enable_close true :enable_rename true :enable_close_on_slash true}}}
 {1 :windwp/nvim-autopairs
  :event :InsertEnter
  :opts {:disable_filetype [:TelescopePrompt :vim]}}
 ;; icons
 :kyazdani42/nvim-web-devicons
 {1 :supermaven-inc/supermaven-nvim
  :lazy false
  :opts {:keymaps {:accept_suggestion :<C-l> :accept_word "<C-;>"}}}
 ;; // ^?
 {1 :marilari88/twoslash-queries.nvim :lazy false}
 {1 :JoosepAlviste/nvim-ts-context-commentstring :opts {}}
 {1 :numToStr/Comment.nvim
  :config (fn []
            (. (require :ts_context_commentstring.integrations.comment_nvim)
               :create_pre_hook))}
 {1 :akinsho/git-conflict.nvim :version "*" :config true :lazy false}
 {1 :brenoprata10/nvim-highlight-colors :lazy false :opts {}}
 {1 :f-person/auto-dark-mode.nvim
  :lazy false
  :opts {:set_dark_mode (fn []
                          (vim.api.nvim_set_option_value :background :dark {})
                          (vim.cmd.colorscheme :catppuccin))
         :set_light_mode (fn []
                           (vim.api.nvim_set_option_value :background :light {})
                           (vim.cmd.colorscheme :rose-pine))
         :update_interval 500}}]
