# 💤 jpk's LazyVim

This is mostly just [LazyVim](https://github.com/LazyVim/LazyVim) with some personalizations.

### Context

(TODO: Describe what this editor setup is used for.)

### Changes From Stock LazyVim

- Disabled plugins (See `lua/config/disabled.lua`):
    - No tabs (disabled `akinsho/bufferline.nvim`)
    - No welcome screen thing (disabled `nvimdev/dashboard-nvim`)
- Adds winbars for each split using `nvim-lualine/lualine.nvim`
- Adds `file_ignore_patterns` for `nvim-telescope/telescope`
    - .git
    - Python stuff
- Misc settings in `lua/config/options.lua`:
    - Indention preferences (four-space, don't @ me)
    - 80 column stuff
        - Visual ruler using `colorcolumn`
        - Set textwidth for `gw`
    - Other stuff TODO
