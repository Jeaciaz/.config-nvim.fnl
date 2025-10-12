(local lsp vim.lsp)

(fn root-markers-with-field [root-files new-names field fname]
  (let [path (vim.fn.fnamemodify fname ":h")
        found (vim.fs.find new-names {: path :upward true})]
    (each [_ f (ipairs (or found {}))]
      (each [line (io.lines f)]
        (when (line:find field)
          (tset root-files (+ (length root-files) 1) (vim.fs.basename f))
          (lua :break))))
    root-files))

(fn insert-package-json [root-files field fname]
  (root-markers-with-field root-files [:package.json :package.json5] field
                           fname))

{:before_init (fn [_ config]
                (local root-dir config.root_dir)
                (when root-dir
                  (set config.settings (or config.settings {}))
                  (set config.settings.workspaceFolder
                       {:name (vim.fn.fnamemodify root-dir ":t") :uri root-dir})
                  (local flat-config-files
                         [:eslint.config.js
                          :eslint.config.mjs
                          :eslint.config.cjs
                          :eslint.config.ts
                          :eslint.config.mts
                          :eslint.config.cts])
                  (each [_ file (ipairs flat-config-files)]
                    (when (= (vim.fn.filereadable (.. root-dir "/" file)) 1)
                      (set config.settings.experimental
                           (or config.settings.experimental {}))
                      (set config.settings.experimental.useFlatConfig true)
                      (lua :break)))
                  (local pnp-cjs (.. root-dir :/.pnp.cjs))
                  (local pnp-js (.. root-dir :/.pnp.js))
                  (when (or (vim.uv.fs_stat pnp-cjs) (vim.uv.fs_stat pnp-js))
                    (local cmd config.cmd)
                    (set config.cmd (vim.list_extend [:yarn :exec] cmd)))))
 :cmd [:vscode-eslint-language-server :--stdio]
 :filetypes [:javascript
             :javascriptreact
             :javascript.jsx
             :typescript
             :typescriptreact
             :typescript.tsx
             :vue
             :svelte
             :astro]
 :handlers {:eslint/confirmESLintExecution (fn [_ result]
                                             (when (not result) (lua "return "))
                                             4)
            :eslint/noLibrary (fn []
                                (vim.notify "[lspconfig] Unable to find ESLint library."
                                            vim.log.levels.WARN)
                                {})
            :eslint/openDoc (fn [_ result]
                              (when result (vim.ui.open result.url))
                              {})
            :eslint/probeFailed (fn []
                                  (vim.notify "[lspconfig] ESLint probe failed."
                                              vim.log.levels.WARN)
                                  {})}
 :on_attach (fn [client]
              (vim.api.nvim_buf_create_user_command 0 :LspEslintFixAll
                                                    (fn []
                                                      (local bufnr
                                                             (vim.api.nvim_get_current_buf))
                                                      (client:exec_cmd {:arguments [{:uri (vim.uri_from_bufnr bufnr)
                                                                                     :version (. lsp.util.buf_versions
                                                                                                 bufnr)}]
                                                                        :command :eslint.applyAllFixes
                                                                        :title "Fix all Eslint errors for current buffer"}
                                                                       {: bufnr}))
                                                    {}))
 :root_dir (fn [bufnr on-dir]
             (var root-file-patterns
                  [:.eslintrc
                   :.eslintrc.js
                   :.eslintrc.cjs
                   :.eslintrc.yaml
                   :.eslintrc.yml
                   :.eslintrc.json
                   :eslint.config.js
                   :eslint.config.mjs
                   :eslint.config.cjs
                   :eslint.config.ts
                   :eslint.config.mts
                   :eslint.config.cts])
             (local fname (vim.api.nvim_buf_get_name bufnr))
             (set root-file-patterns
                  (insert-package-json root-file-patterns :eslintConfig fname))
             (on-dir (vim.fs.dirname (. (vim.fs.find root-file-patterns
                                                     {:path fname :upward true})
                                        1))))
 :settings {:codeAction {:disableRuleComment {:enable true
                                              :location :separateLine}
                         :showDocumentation {:enable true}}
            :codeActionOnSave {:enable false :mode :all}
            :experimental {:useFlatConfig false}
            :format true
            :nodePath ""
            :onIgnoredFiles :off
            :packageManager nil
            :problems {:shortenToSingleLine false}
            :quiet false
            :rulesCustomizations {}
            :run :onType
            :useESLintClass false
            :validate :on
            :workingDirectory {:mode :location}}
 :workspace_required true}
