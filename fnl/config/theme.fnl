(local tmux-theme-dir (.. (vim.fn.stdpath :config) :/../tmux))

(fn apply-custom-highlights! []
  (let [normal (vim.api.nvim_get_hl 0 {:name :Normal :link false})
        muted (vim.api.nvim_get_hl 0 {:name :Comment :link false})
        nested (vim.api.nvim_get_hl 0 {:name :Function :link false})
        toplevel (vim.api.nvim_get_hl 0 {:name :Keyword :link false})
        palette (. (require :cyberdream.colors)
                   (if (= vim.o.background :light) :light :default))]
    ;; Keep the theme's muted shade separate from readable comments.
    (vim.api.nvim_set_hl 0 :QuietSyntax {:fg muted.fg})
    (vim.api.nvim_set_hl 0 :NeutralSyntax {:fg normal.fg})
    (vim.api.nvim_set_hl 0 :NestedDeclaration {:fg nested.fg})
    (vim.api.nvim_set_hl 0 :ToplevelDeclaration {:fg toplevel.fg})
    (vim.api.nvim_set_hl 0 :Comment {:fg palette.yellow :italic true}))
  ;; Neutralize whole capture families, including explicitly styled subgroups.
  ;; Semantic-token groups linked to these captures inherit the same baseline.
  (let [neutral-families {"@keyword" true "@operator" true
                          "@function" true "@constructor" true
                          "@variable" true "@type" true "@module" true}]
    (each [group _ (pairs (vim.api.nvim_get_hl 0 {}))]
      (when (. neutral-families (string.match group "^(@[^.]+)"))
        (vim.api.nvim_set_hl 0 group {:link :NeutralSyntax}))))
  (each [_ pair (ipairs [["@import-statement" :QuietSyntax]
                         ["@quiet-syntax" :QuietSyntax]
                         ["@neutral-syntax" :NeutralSyntax]
                         ["@comment" :Comment]
                         ["@constant" :NeutralSyntax]
                         ["@export-keyword" :ToplevelDeclaration]
                         ["@jsx_interpolation_bracket" "@punctuation.bracket"]
                         ["@jsx_text" "@string"]
                         ["@parameter-decl" :NestedDeclaration]
                         ["@punctuation-arrow" "@punctuation.special"]
                         ["@toplevel-declaration" :ToplevelDeclaration]])]
    (vim.api.nvim_set_hl 0 (. pair 1) {:link (. pair 2)})))

(fn apply! [use-light?]
  (set vim.o.background (if use-light? :light :dark))
  (vim.cmd.colorscheme :cyberdream)
  (when vim.env.TMUX
    (let [file (.. tmux-theme-dir
                   (if use-light? :/cyberdream-light.conf :/cyberdream.conf))]
      (vim.fn.system [:tmux :source-file file]))))

(fn toggle! []
  (apply! (= vim.o.background :dark)))

((. (require :cyberdream) :setup) {:cache false
                                   :italic_comments true
                                   :transparent false
                                   :variant :auto})

(vim.api.nvim_create_autocmd :ColorScheme
                             {:group (vim.api.nvim_create_augroup :QuietSyntax {:clear true})
                              :pattern :cyberdream
                              :callback apply-custom-highlights!})
(apply! false)
(vim.api.nvim_create_user_command :CyberdreamToggle toggle! {})

{:toggle toggle!}
