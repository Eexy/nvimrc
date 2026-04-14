# Nvim Config

## Prerequisites

- [Neovim](https://neovim.io) >= 0.12
- [Node.js](https://nodejs.org)
- [Rust](https://www.rust-lang.org/tools/install) with nightly toolchain (required by blink.cmp)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [tree-sitter-cli](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md)
- [lazygit](https://github.com/jesseduffield/lazygit)

## Install

```bash
git clone https://github.com/Eexy/nvimrc ~/.config/nvim
```

- Remove the `.git` directory: `rm -rf ~/.config/nvim/.git`

## LSP

LSP configuration files should be placed in the `lsp/` directory. Each file should be named after the language server it configures.

Server configuration options can be found in [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).

LSP servers can be installed via [Mason](https://github.com/williamboman/mason.nvim) using `:Mason`.

## Update

- Run `:Lazy sync` to update all plugins
