(local color! (require :util.color!))
(local set! (require :util.set!))
(local hi! (require :util.hi!))

;; Setup lazy
(let [lazy-path (.. (vim.fn.stdpath :data) :/lazy/lazy.nvim)]
  (when (not ((. (or vim.uv vim.loop) :fs_stat) lazy-path))
    (vim.fn.system [:git
                    :clone
                    "--filter=blob:none"
                    "https://github.com/folke/lazy.nvim.git"
                    :--branch=stable
                    lazy-path]))
  (vim.opt.runtimepath:prepend lazy-path))

(set vim.g.mapleader " ")
(set vim.g.maplocalleader " ")

(let [lazy (require :lazy)]
  (lazy.setup :plugins
              {:checker {:enabled false}
               :defaults {:lazy true}
               :install {:colorscheme [:nordic]}
               :performance {:rtp {:reset false} :reset_packpath false}}))

(require :keybinds)
(require :lsp)
(require :plugin)

(set! :cursorline)
(set! :title)
(set! :autoindent)
(set! :hlsearch)
(set! :ignorecase)
(set! :number)
(set! :relativenumber)
(set! :guicursor "n-v-c:block-Cursor/lCursor,i-ci:ver25-Cursor/lCursor")
(set! :wrap false)
(set! :tabstop 2)
(set! :softtabstop 2)
(set! :shiftwidth 2)
(set! :expandtab true)
(set! :smartindent true)
(set! :termguicolors true)
(set! :colorcolumn :120)
(set! :swapfile false)
(set! :scrolloff 8)
(set! :updatetime 1000)
(set! :signcolumn :yes)
(set! :background :dark)
(color! :kanagawa)

(hi! :Cursor {:fg "#d4cde5" :bg "#5eaf77"})

(when vim.g.neovide (vim.cmd "cd ~/dev/finaloop-app"))
