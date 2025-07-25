# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set the theme. Some popular choices: "robbyrussell", "agnoster", "bira", "powerlevel10k" (if installed).
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable plugins. Add your desired plugins to the list.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  sudo
  web-search
  copydir
  cppyfile
)

# Load Oh My Zsh.
source $ZSH/oh-my-zsh.sh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Prompt configuration.
# Highlight git branch in prompt.
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:*' enable git
PROMPT='%F{cyan}%n@%m%f %1~ $(vcs_info_msg_0_) %# '

# Syntax highlighting and autosuggestions.
source ${(q-)ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ${(q-)ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases for convenience.
alias ll="ls -alF"      # List all files in long format.
alias la="ls -A"        # List all except . and ..
alias l="ls -CF"        # Simple list with classification.
alias gs="git status"   # Short git status.
alias gc="git commit"   # Git commit shortcut.
alias gp="git push"     # Git push shortcut.
alias v=nvim
alias st=speedtest
alias nr="npm run"
alias nrd="npm run dev"
alias brd="bun run dev"
alias nrpg="npm run prisma:generate"
alias nrpp="npm run prisma:push"
alias nrps="npm run prisma:studio"
alias c=clear
alias ccwd="cd Documents/code"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias mux='pgrep -vx tmux > /dev/null && \
        tmux new -d -s delete-me && \
        tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && \
        tmux kill-session -t delete-me && \
        tmux attach || tmux attach'

# Enable command history navigation with arrow keys.
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# Configure auto-suggestion behavior.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080"

# Key bindings.
bindkey '^r' history-incremental-search-backward  # Ctrl+R for search history.
bindkey '^b' backward-word                        # Ctrl+B to go back a word.

# nvm aliases.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# History settings.
HISTFILE=~/.zsh_history       # Where history is saved.
HISTSIZE=10000                # Number of commands to keep in memory.
SAVEHIST=10000                # Number of commands to save to the history file.
setopt share_history          # Share history between sessions.
setopt hist_ignore_all_dups   # Ignore duplicate commands.
setopt hist_ignore_space      # Ignore commands with leading space.

# Export common environment variables.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR="nvim"
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

# Fix issues with Oh My Zsh loading order for plugins.
zmodload zsh/complist

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/home/yada/.bun/_bun" ] && source "/home/yada/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
