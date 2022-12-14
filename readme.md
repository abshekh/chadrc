## To be used with NvChad
## Installation
```
git clone git@github.com:abshekh/chadrc.git ~/.config/nvim/lua/custom/
ln -s ~/.config/nvim/lua/custom/ftplugin/ ~/.config/nvim

# for lazygit on mac
ln -s ~/.config/nvim/lua/custom/etc/lazygit_config.yml ~/Library/Application\ Support/lazygit/config.yml
alias nvim='nvim --listen /tmp/nvim-server.pipe'
```
## LSP Settings
- Add server in `custom.lsp-servers.init.lua`.
- If settings need to overridden, add settings in `custom.lsp-servers.settings.[server-name].lua`.
  Example: `custom.lsp-servers.settings.sumneko-lua.lua` will update sumneko-lua settings.
