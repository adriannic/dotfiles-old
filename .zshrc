# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

neofetch

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*' menu select

autoload -Uz compinit
compinit

# Exports
export EDITOR="nvim"
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

# Update alias
alias zshupdate='echo "Updating..." && curl https://raw.githubusercontent.com/adriannic/dotfiles/main/.zshrc --output ~/.zshrc 2> /dev/null > /dev/null && curl https://raw.githubusercontent.com/adriannic/dotfiles/main/.p10k.zsh --output ~/.p10k.zsh 2> /dev/null > /dev/null && echo "Updated successfully"' 

# Aliases
alias ls="exa -ghmuU --git"
alias ols="/usr/bin/ls"
alias ip="ip -color=auto"
alias l="ls -la"
alias la="ls -a"
alias ll="ls -l"
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ip="ip -color=auto"
alias myip="curl http://ipecho.net/plain; echo"
alias space="du -ahd1 2> /dev/null | sort -h"
alias zshconf="$EDITOR ~/.zshrc"
alias edit="$EDITOR"
alias bye="shutdown now"
alias cya="reboot"
alias nv="neovide . && exit"

## Laptop specific aliases
alias torre="ssh adriannic@88.23.101.208"

## Desktop specific aliases
alias towindows="systemctl reboot --boot-loader-entry=auto-windows"
alias tablet='xsetwacom set "Wacom One by Wacom M Pen stylus" MapToOutput HEAD-0'

# Plugins
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval $(thefuck --alias)
