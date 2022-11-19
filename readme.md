## To be used with NvChad
## Installation
```
git clone git@github.com:abshekh/chadrc.git ~/.config/nvim/lua/custom/
ln -s ~/.config/nvim/lua/custom/ftplugin/ ~/.config/nvim
```
## LSP Settings
- Add server in `custom.lsp-servers.init.lua`.
- If settings need to overridden, add settings in `custom.lsp-servers.settings.[server-name].lua`.
  Example: `custom.lsp-servers.settings.sumneko-lua.lua` will update sumneko-lua settings.
