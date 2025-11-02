{1 :saghen/blink.cmp
 :version "*"
 :lazy false
 :opts {:keymap {:preset :super-tab}
        :sources {:default [:lsp :path :buffer]}
        :completion {:documentation {:auto_show true :auto_show_delay_ms 200}}
        :signature {:enabled true}
        :fuzzy {:implementation :prefer_rust_with_warning}}}
