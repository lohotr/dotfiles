# How did I configure my neovim

## Configure `indent-blankline.nvim`
**Setup Plugin**:
https://github.com/ronthl/dotfiles/blob/fdbd320d4e723dfc4f0beb940b2321cdff40b836/.config/nvim/lua/plugins.lua#L92-L103

**Setup Options**:
https://github.com/ronthl/dotfiles/blob/fdbd320d4e723dfc4f0beb940b2321cdff40b836/.config/nvim/lua/options.lua#L29-L31

### Show indent blank line with character `┊`
https://github.com/ronthl/dotfiles/blob/fdbd320d4e723dfc4f0beb940b2321cdff40b836/.config/nvim/lua/plugins.lua#L98

![char.png](./screenshot/char.png)

### Show indent for the current context
https://github.com/ronthl/dotfiles/blob/fdbd320d4e723dfc4f0beb940b2321cdff40b836/.config/nvim/lua/plugins.lua#L99

Notice that it will highlight the current curly brackets you are staying on.

![show_current_context.png](./screenshot/show_current_context.png)

### Show the end line with the character `↴`
https://github.com/ronthl/dotfiles/blob/fdbd320d4e723dfc4f0beb940b2321cdff40b836/.config/nvim/lua/plugins.lua#L101
https://github.com/ronthl/dotfiles/blob/fdbd320d4e723dfc4f0beb940b2321cdff40b836/.config/nvim/lua/options.lua#L30-L31

![show_end_of_line.png](./screenshot/show_end_of_line.png)
