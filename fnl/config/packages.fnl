(fn github [repo]
  (.. "https://github.com/" repo))

(vim.api.nvim_create_autocmd :PackChanged
                             {:callback (fn [event]
                                          (let [kind event.data.kind
                                                spec event.data.spec]
                                            (when (and (= spec.name
                                                          :nvim-treesitter)
                                                       (or (= kind :install)
                                                           (= kind :update)))
                                              (vim.cmd.packadd :nvim-treesitter)
                                              (vim.cmd.TSUpdate))))})

(vim.pack.add [{:src (github :scottmckendry/cyberdream.nvim)
                :version (vim.version.range :^5.0.0)}
               {:src (github :nvim-tree/nvim-web-devicons)}
               {:src (github :nvim-lualine/lualine.nvim)}
               {:src (github :nvim-lua/plenary.nvim)}
               {:src (github :ibhagwan/fzf-lua)}
               {:src (github :mikavilpas/yazi.nvim)}
               {:src (github :neovim/nvim-lspconfig)}
               {:src (github :nvim-treesitter/nvim-treesitter) :version :main}
               {:src (github :nvim-treesitter/nvim-treesitter-context)}
               {:src (github :windwp/nvim-ts-autotag)}
               {:src (github :windwp/nvim-autopairs)}
               {:src (github :stevearc/conform.nvim)}
               {:src (github :lewis6991/gitsigns.nvim)}
               {:src (github :akinsho/git-conflict.nvim)}
               {:src (github :marilari88/twoslash-queries.nvim)}]
              {:confirm false :load true})
