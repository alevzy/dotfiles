# ===== MINIMAL EXAMPLE =====
# command line prompt format
PS1='%F{blue}%B%~%b%f %F{green}❯%f '

# vi style keymap
bindkey -v

# history settings
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt inc_append_history
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward

# aliases
alias ls='ls --color=auto -hv'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -c=auto'
alias ll='ls -l'
alias la='ls -lA'

# completion
autoload -U compinit && compinit

# load local stuff if present
if [[ -f $HOME/.local_sh_config ]]; then
    source $HOME/.local_sh_config
fi

# powerlevel10k
source $HOME/.powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

