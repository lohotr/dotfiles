# My NeoVim 

## Install NeoVim from Source
Github repo: [neovim](https://github.com/neovim/neovim)

### Install on Ubuntu
1. Clone source code.
2. Checkout to the `stable` tag (recommended)
3. Install build tools and dependencies
```bash
sudo apt update
sudo apt install make cmake unzip gettext -y
```
4. Build NeoVim
```bash
make CMAKE_BUILD_TYPE=RelWithDebInfo
```
5. Install NeoVim
```bash
sudo make install
```

**Result**
![](./screenshot/nvim-result.png)
