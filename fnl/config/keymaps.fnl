(local maps (require :config.maps))
(local map! maps.map)
(local review (require :config.review))

(fn tab-forward []
  (if (= (vim.fn.pumvisible) 1)
      :<C-n>
      (if (vim.snippet.active {:direction 1})
          (do
            (vim.snippet.jump 1) "")
          :<Tab>)))

(fn tab-backward []
  (if (= (vim.fn.pumvisible) 1)
      :<C-p>
      (if (vim.snippet.active {:direction -1})
          (do
            (vim.snippet.jump -1) "")
          :<S-Tab>)))

(fn enter-or-accept []
  (if (= (vim.fn.pumvisible) 1) :<C-y> :<CR>))

(fn toggle-inlay-hints []
  (let [filter {:bufnr 0}]
    (vim.lsp.inlay_hint.enable (not (vim.lsp.inlay_hint.is_enabled filter))
                               filter)))

(fn show-jumped-diagnostic [_ buffer]
  (vim.diagnostic.open_float {:bufnr buffer :focus false :scope :cursor}))

(fn navigate-hunk [direction fallback]
  (if vim.wo.diff
      (vim.cmd.normal {:args [fallback] :bang true})
      ((. (require :gitsigns) :nav_hunk) direction)))

(vim.keymap.set :n :<Space> :<Nop> {:silent true})

(map! :n :<C-g> #(vim.cmd.nohlsearch) "Clear search highlight")
(map! :n :<leader>fs #(vim.cmd.write) "Write buffer")
(map! :n "<leader>[" #(vim.cmd.cprevious) "Previous quickfix entry")
(map! :n "<leader>]" #(vim.cmd.cnext) "Next quickfix entry")

(map! :n :<C-p> #((. (require :fzf-lua) :files)) "Find files")
(map! :n :<leader>gg #((. (require :fzf-lua) :live_grep)) "Live grep")
(map! :n :<leader>gs #((. (require :fzf-lua) :grep_cword)) "Grep word")
(map! :n :<leader>fb #((. (require :fzf-lua) :buffers)) "Find buffers")
(map! :n :<leader>fr #((. (require :fzf-lua) :oldfiles)) "Recent files")
(map! :n :<leader>rq #((. (require :fzf-lua) :quickfix)) "Search quickfix")

(map! :n :<leader>rr review.refresh "Refresh worktree review")
(map! :n :<leader>gy #(review.copy-reference false) "Copy file reference")
(map! :x :<leader>gy #(review.copy-reference true) "Copy selection reference")
(map! :n :<leader>ff (. (require :config.format) :format) "Format buffer")
(map! [:n :x] :<leader>e #((. (require :yazi) :yazi)) "Open Yazi")

(map! :n "[c" #(navigate-hunk :prev "[c") "Previous Git hunk")
(map! :n "]c" #(navigate-hunk :next "]c") "Next Git hunk")
(map! :n :<leader>gp #((. (require :gitsigns) :preview_hunk))
      "Preview Git hunk")

(map! :n :gd vim.lsp.buf.definition "Go to definition")
(map! :n :<C-j>
      #(vim.diagnostic.jump {:count 1 :on_jump show-jumped-diagnostic})
      "Next diagnostic")

(map! :n :<leader>th toggle-inlay-hints "Toggle inlay hints")
(map! :n :<leader>ut (. (require :config.theme) :toggle) "Toggle light theme")

(map! :i :<Tab> tab-forward "Completion or snippet forward" {:expr true})
(map! :i :<S-Tab> tab-backward "Completion or snippet backward" {:expr true})
(map! :i :<CR> enter-or-accept "Accept completion" {:expr true})
(map! :i :<C-Space> vim.lsp.completion.get "Open completion menu")

(map! :n :<leader>? maps.show "Show custom keymaps")
