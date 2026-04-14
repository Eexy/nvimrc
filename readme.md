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

## Update

- Run `:Lazy sync` to update all plugins
