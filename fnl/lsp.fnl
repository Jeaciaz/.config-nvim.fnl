(vim.lsp.enable [:fennel :eslint :ts_ls])

(vim.diagnostic.config {:signs {:text {vim.diagnostic.severity.ERROR "󰅚"
                                       vim.diagnostic.severity.WARN "󰀪"
                                       vim.diagnostic.severity.HINT "󰌶"
                                       vim.diagnostic.severity.INFO ""}}
                        :virtual_lines true})
