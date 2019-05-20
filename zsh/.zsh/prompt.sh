function current_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

function machine_info {
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]  || [ -n "$IS_CONTAINER" ]
    then
        echo "%F{magenta}$(hostname)%f: "
    fi
}

function zle-line-init zle-keymap-select {
    VIM_NORMAL="%B%F{blue} [% NORMAL]% %f%b"
    VIM_INSERT="%B%F{green} [% INSERT]% %f%b"
    RPS1="$(rprompt) ${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}"
    zle reset-prompt
}

function rprompt {
    echo "%B$(git_info)%b"
}

# GIT INFO
function git_branch() {
  echo $(git name-rev --name-only --no-undefined --always HEAD 2> /dev/null)
}

function git_info() {
    if [[ -n $(git diff --name-only --staged 2> /dev/null) ]]; then
        echo '%F{green}[$(git_branch)]%f'
    elif [[ -n $(git ls-files --modified 2> /dev/null) ]]; then
        echo '%F{magenta}[$(git_branch)]%f'
    elif [[ -n $(git status 2> /dev/null) ]]; then
        echo '[$(git_branch)]'
    fi
}

PROMPT='$(machine_info)%B%F{green}$(current_pwd)%f%b '
