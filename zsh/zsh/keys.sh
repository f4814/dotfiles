# History
bindkey '^r' history-incremental-search-backward
bindkey '[A' history-search-backward
bindkey '[B' history-search-forward

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
