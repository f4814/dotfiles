############
## BASICS ##
############

setopt no_beep # No beeping
setopt auto_cd # Cd without cd
bindkey -v     # VIm mode


#############
## History ##
#############

setopt append_history # Multiple sessions to one history
setopt inc_append_history # Add when command is typed
setopt hist_ignore_dups # No dups in history
setopt hist_reduce_blanks # Delete unneccessary blanks
HISTFILE=~/.zsh_history

################
## Completion ##
################

setopt always_to_end # Move cursor to end of expand
unsetopt menu_complete
setopt auto_menu # Show menu on multiple tabs. Requires above
setopt complete_in_word # Completion within a word
setopt COMPLETE_ALIASES

################
## Correction ##
################

setopt correct
setopt correctall

############
## Prompt ##
###########ä

zle -N zle-line-init # interactive vim prompt
zle -N zle-keymap-select # Interactive vim prompt
setopt prompt_subst
setopt transient_rprompt
