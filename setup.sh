cp .config $HOME/
cp .zshrc $HOME/
curl -L https://git.io/antigen > $HOME/.antigen.zsh
curl -fsSL https://starship.rs/install.sh | bash -s -- --yes