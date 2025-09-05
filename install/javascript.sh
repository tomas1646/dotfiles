#!/bin/bash

PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash'

source ~/.bashrc

nvm install 22.14.0
nvm use 22.14.0

# Yarn
npm install --global yarn

# Typescript lsp
npm install -g typescript typescript-language-server

# Eslint
npm install -g vscode-langservers-extracted

# Docker LSP
npm install -g dockerfile-language-server-nodejs

# Prettier
npm install -g prettier
