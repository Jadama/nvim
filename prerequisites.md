# Installation Notes
## Prerequisites
- [Clang (coc)](https://github.com/llvm/llvm-project/releases/)
- [visual studio build tools (C++ Desktop) (coc)](https://visualstudio.microsoft.com/de/downloads/)
- [NodeJs LTS (coc) (<18 for copilot)](https://nodejs.org/en/)
- [NerdFont (Dejavu sans mono zB) (dev icons)](https://www.nerdfonts.com/font-downloads)
- [Python 3](https://www.python.org/downloads/)
- pynvim installieren (pip3 install pynvim)
- [Ripgrep (Telescope)](https://github.com/BurntSushi/ripgrep/releases)
- Chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
- Treesitter 
    npm install -g tree-sitter-cli
- FZF
    choco install fzf

## Plugin manager
The config files use [Packer](https://github.com/wbthomason/packer.nvim). Packer can be installed from Powershell commandline like this:
    git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"

## Plugin installs
### COC
- coc-snippets
- coc-tsserver
- coc-lua

### Treesitter
- typescript
- tsx
