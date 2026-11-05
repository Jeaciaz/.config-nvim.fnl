(vim.diagnostic.config {:severity_sort true
                        :signs {:text {vim.diagnostic.severity.ERROR "󰅚"
                                       vim.diagnostic.severity.WARN "󰀪"
                                       vim.diagnostic.severity.HINT "󰌶"
                                       vim.diagnostic.severity.INFO ""}}
                        :underline true
                        :virtual_lines false
                        :virtual_text {:source :if_many :spacing 2}})

(vim.api.nvim_create_autocmd :LspAttach
                             {:callback (fn [event]
                                          (let [client (assert (vim.lsp.get_client_by_id event.data.client_id))]
                                            (when (: client :supports_method
                                                     :textDocument/completion)
                                              (vim.lsp.completion.enable true
                                                                         client.id
                                                                         event.buf
                                                                         {:autotrigger true}))
                                            (when (: client :supports_method
                                                     :textDocument/inlayHint)
                                              (vim.lsp.inlay_hint.enable true
                                                                         {:bufnr event.buf}))
                                            (when (= client.name :ts_ls)
                                              ((. (require :twoslash-queries)
                                                  :attach) client event.buf))))})

(vim.lsp.config :clojure_lsp {:filetypes [:clojure]})

(local servers [{:command :typescript-language-server :name :ts_ls}
                {:command :vscode-eslint-language-server :name :eslint}
                {:command :rust-analyzer :name :rust_analyzer}
                {:command :clojure-lsp :name :clojure_lsp}
                {:command :fennel-ls :name :fennel_ls}])

(each [_ server (ipairs servers)]
  (when (= (vim.fn.executable server.command) 1)
    (vim.lsp.enable server.name)))
