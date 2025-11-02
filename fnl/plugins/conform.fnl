;; formatting engine

(fn fmt []
  (let [conform (require :conform)]
    (conform.format {:bufnr (vim.api.nvim_get_current_buf) :lsp_format :first})))

{1 :stevearc/conform.nvim
 :opts {:formatters_by_ft {:javascript [:eslint :prettierd]
                           :typescript [:eslint :prettierd]
                           :typescriptreact [:eslint :prettierd]
                           :lua [:lua-format]
                           :fennel [:fnlfmt]
                           :sql [:sqlfmt]}}
 :keys [[:<leader>ff fmt]]}
