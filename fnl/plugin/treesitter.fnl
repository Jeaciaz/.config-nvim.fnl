(require-macros :hibiscus.vim)

(local langs [:bash
              :css
              :dockerfile
              :graphql
              :html
              :javascript
              :json
              :lua
              :nginx
              :fennel
              :sql
              :tsx
              :typescript
              :yaml
              :typescriptreact])

(fn setup-ts! []
  (local ts (require :nvim-treesitter))
  (local autotag (require :nvim-ts-autotag))
  (ts.install langs)
  (augroup! :start-ts [[FileType] langs #(vim.treesitter.start)])
  (set! foldexpr "v:lua.vim.treesitter.foldexpr()")
  (set! indentexpr "v:lua.require\"nvim-treesitter\".indentexpr()")
  (autotag.setup {:opts {:auto_close_on_slash true}}))

[{1 :nvim-treesitter/nvim-treesitter
  :lazy false
  :branch :main
  :build ":TSUpdate"
  :config setup-ts!}
 {1 :nvim-treesitter/nvim-treesitter-context
  :lazy false
  :opts {:enable true :separator "~"}}]
