(local conform (require :conform))

(conform.setup {:default_format_opts {:lsp_format :fallback}
                :formatters {:oxfmt {:require_cwd true}}
                :formatters_by_ft {:clojure {1 :cljfmt :lsp_format :fallback}
                                   :css {1 :oxfmt
                                         :stop_after_first true
                                         :lsp_format :fallback}
                                   :fennel {1 :fnlfmt :lsp_format :fallback}
                                   :html {1 :oxfmt
                                          :stop_after_first true
                                          :lsp_format :fallback}
                                   :javascript {1 :oxfmt
                                                :stop_after_first true
                                                :lsp_format :fallback}
                                   :javascriptreact {1 :oxfmt
                                                     :stop_after_first true
                                                     :lsp_format :fallback}
                                   :json {1 :oxfmt
                                          :stop_after_first true
                                          :lsp_format :fallback}
                                   :jsonc {1 :oxfmt
                                           :stop_after_first true
                                           :lsp_format :fallback}
                                   :markdown {1 :oxfmt
                                              :stop_after_first true
                                              :lsp_format :fallback}
                                   :rust {1 :rustfmt :lsp_format :fallback}
                                   :typescript {1 :oxfmt
                                                :stop_after_first true
                                                :lsp_format :fallback}
                                   :typescriptreact {1 :oxfmt
                                                     :stop_after_first true
                                                     :lsp_format :fallback}}
                :notify_no_formatters false})

(fn format! []
  (conform.format {:async true :lsp_format :fallback}))

{:format format!}
