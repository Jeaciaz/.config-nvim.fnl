(require-macros :hibiscus.vim)
{:cmd [:typescript-language-server :--stdio]
 :filetypes [:typescript :typescriptreact :javascript :typescript.tsx]
 :root_dir (fn [bufnr on-dir]
             (let [root-files [:package.json :tsconfig.json]
                   fname (vim.api.nvim_buf_get_name bufnr)]
               (on-dir (. (vim.fs.find root-files {:path fname :upward true}) 1))))
 :on_attach (fn [client bufnr]
              (map! [n] :<leader>fi
                    (fn []
                      (client:exec_cmd {:command :_typescript.organizeImports
                                        :arguments [(vim.fn.expand "%:p")]})))
              (vim.lsp.inlay_hint.enable true))
 :settings {:preferences {:includeInlayFunctionParametersTypeHints true
                          :includeInlayFunctionLikeReturnTypeHints true
                          :includeInlayEnumMemberValueHints true}}}
