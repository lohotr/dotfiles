# My NeoVim 

## Install NeoVim from Source
Github repo: [neovim](https://github.com/neovim/neovim)

### Install on Ubuntu
1. Clone source code.
2. Checkout to the `stable` tag (Optional but recommended)
```bash
git checkout tags/stable
```
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

## Install package manager `lazy.nvim`
https://github.com/ronthl/dotfiles/blob/44543437ddd7164d99047dc3cde9b00fc5271d28/.config/nvim/lua/plugins.lua#L4-L15

## Add theme `onedark.nvim`
https://github.com/ronthl/dotfiles/blob/44543437ddd7164d99047dc3cde9b00fc5271d28/.config/nvim/lua/plugins.lua#L23-L32

**Result**
![](./screenshot/theme-result.png)
