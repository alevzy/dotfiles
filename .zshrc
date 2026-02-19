# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
alias ls='lsd --color=auto -hv'
alias ll='lsd -l'
alias la='lsd -lA'
alias lt='lsd --tree'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -c=auto'

# completion
autoload -U compinit && compinit

# load local stuff if present
if [[ -f $HOME/.local_config.sh ]]; then
    source $HOME/.local_config.sh
fi

# powerlevel10k
source $HOME/.powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zsh-syntax-highlighting settings
# refer to:
# https://github.com/morhetz/gruvbox
# https://github.com/clone-clownprince/gruvbox-p10k
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[comment]='fg=#7C6F4D'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#B8BB26'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#B8BB26'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#B8BB26'
ZSH_HIGHLIGHT_STYLES[function]='fg=#B8BB26'
ZSH_HIGHLIGHT_STYLES[command]='fg=#B8BB26'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#B8BB26,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#FABD2F,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#FABD2F'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#FABD2F'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#D3869B'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#8EC07C'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#8EC07C'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#8EC07C'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#D79921'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#EBDBB2'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#EBDBB2'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#EBDBB2'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#D79921'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#D79921'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#D79921'
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#E1ACFF'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#E1ACFF'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#E1ACFF'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#FB4934'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#E1ACFF'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#FB4934'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#E1ACFF'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#EBDBB2'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#FB4934'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#EBDBB2'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#EBDBB2'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#EBDBB2'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#EBDBB2'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#FB4934'
ZSH_HIGHLIGHT_STYLES[path]='fg=#EBDBB2'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#D79921'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#EBDBB2'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#D79921'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#EBDBB2'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#D3869B'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#FB4934'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#EBDBB2'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#EBDBB2'
ZSH_HIGHLIGHT_STYLES[default]='fg=#EBDBB2'
ZSH_HIGHLIGHT_STYLES[cursor]='standout'

# zsh-syntax-highlighting activation
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
