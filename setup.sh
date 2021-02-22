cp -r .config .zshrc $HOME/
curl -L https://git.io/antigen > $HOME/.antigen.zsh
curl -fsSL https://starship.rs/install.sh | bash -s -- --yes

# Set up Yarn tokens (if available)
if [ -n ${NPM_AUTH_TOKEN_ATLASSIAN+x} ]; 
then yarn config set --home npmScopes.atlassian.npmAuthToken $NPM_AUTH_TOKEN_ATLASSIAN 
fi

if [ -n ${NPM_AUTH_TOKEN_ATLASSIANSOX+x} ]; 
then yarn config set --home npmScopes.atlassiansox.npmAuthToken $NPM_AUTH_TOKEN_ATLASSIANSOX 
fi
