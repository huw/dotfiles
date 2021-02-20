export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export EDITOR=nano
export VISUAL="$EDITOR"

# Starship
eval "$(starship init zsh)"

# Antigen
source ~/.antigen.zsh

# Antigen + Oh My Zsh
antigen use oh-my-zsh

# oh-my-zsh packages
antigen bundle git

# Antigen bundles & options
antigen bundle djui/alias-tips
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions

antigen apply

# ZSH settings
export COMPLETION_WAITING_DOTS="true"
setopt correct
unsetopt correctall
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt share_history
setopt pushd_ignore_dups

unsetopt PROMPT_SP

# Autocomplete hacks
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==34=34}:${(s.:.)LS_COLORS}")';

# Newline hack
function empty-buffer-to-ls() {
    if [[ $#BUFFER == 0 ]]; then
        BUFFER="la"
    fi
}
zle -N zle-line-finish empty-buffer-to-ls

# GPG + SSH
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent