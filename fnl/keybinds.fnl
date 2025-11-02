(local map! (require :util.map!))

;; Set keybindings with "map!" macro like this:
;; (map! [list of modes] "keybinding" function "keybinding description")

;; Removes highlighting after the search with "/" or "?"
(map! [:n] :<C-g> ":noh<CR>" "Remove highlighting")

(map! [:n] :<leader>fs ":w<CR>")
(map! [:n] :<Space> :<Nop>)
(map! [:i] :<C-v> "<Esc>\"+pa")
(map! [:n] :<C-v> "\"+p")
(map! [:n] :<C-c> "\"+yy")
(map! [:v] :<C-c> "\"+y")
(map! [:n] "<Leader>[" :<Cmd>cp<CR>)
(map! [:n] "<Leader>]" :<Cmd>cn<CR>)
(map! [:n] :gr vim.lsp.buf.references)
(map! [:n] :gd vim.lsp.buf.definition)
(map! [:n] :gt vim.lsp.buf.type_definition)
