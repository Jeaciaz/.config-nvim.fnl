# Neovim config

Review-first Neovim 0.12 configuration authored in Fennel.

## Runtime

- Neovim 0.12.5+
- [Hotpot](https://github.com/rktjmp/hotpot.nvim) v2, compiling Fennel to cache
- Native `vim.pack` package management
- Cyberdream dark theme, with optional light mode

`init.lua` only bootstraps Hotpot. Configuration lives under `fnl/config/`.
Plugin revisions are stored in `nvim-pack-lock.json`.

## External tools

- `git`, `ripgrep`, `fzf`, `yazi`, and a Nerd Font
- `tree-sitter` CLI 0.26.1+ and a C compiler
- Language servers are managed outside Neovim: TypeScript, ESLint, Rust,
  Clojure, and Fennel configs activate only when their executables exist
- Formatters are managed outside Neovim: project-local `oxfmt`, `rustfmt`,
  `cljfmt`, and `fnlfmt`; LSP formatting is the fallback

## Workflow

- `<leader>?` lists every custom keymap
- `<leader>rr` loads all worktree changes against `HEAD` into quickfix
- `<leader>gy` copies a repo-relative file and line reference
- `<leader>e` opens Yazi at the current file
- `<leader>ff` formats manually
- `<leader>ut` toggles Cyberdream light mode

Run `:checkhealth` after installing external tools. Use `vim.pack.update()` to
review package updates, then write its confirmation buffer to apply them.
