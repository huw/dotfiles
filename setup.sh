cp -r .config .zshrc $HOME/
curl -L https://git.io/antigen > $HOME/.antigen.zsh
curl -fsSL https://starship.rs/install.sh | bash -s -- --yes

# Set up Yarn tokens (if available)
if [ ! -z ${NPM_AUTH_TOKEN_ATLASSIAN+x} ]; 
then 
  yarn config set --home npmScopes.atlassian.npmAuthToken $NPM_AUTH_TOKEN_ATLASSIAN 
fi

if [ ! -z ${NPM_AUTH_TOKEN_ATLASSIANSOX+x} ]; 
then 
  yarn config set --home npmScopes.atlassiansox.npmAuthToken $NPM_AUTH_TOKEN_ATLASSIANSOX 
fi

# Set up SSH key for Codespaces
if [ ! -z ${CODESPACES_SSH_KEY_PRIVATE+x} ]; 
then 
  echo $CODESPACES_SSH_KEY_PRIVATE > ~/.ssh/id_codespaces
  chmod 600 ~/.ssh/id_codespaces
fi
