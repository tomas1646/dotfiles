#!/bin/bash

PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install 22.14.0
nvm use 22.14.0

# Yarn
npm install --global yarn

# Typescript lsp
npm install -g typescript typescript-language-server

# Astro LSP
npm install -g @astrojs/language-server

# Eslint
npm install -g vscode-langservers-extracted
npm install -g eslint_d

# Docker LSP
npm install -g dockerfile-language-server-nodejs

# Prettier
npm install -g prettier
