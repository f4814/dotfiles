function current_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

function machine_info {
    if [ -z $IS_USER_PC ];
    then
        echo "%F{magenta}$(hostname)%f: "
    fi
}

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(rprompt) $EPS1"
    zle reset-prompt
}

function rprompt {
    echo "$(git_info)"
}

# GIT INFO
function git_branch() {
  echo $(git name-rev --name-only --no-undefined --always HEAD 2> /dev/null)
}

function git_info() {
    if [[ -n $(git diff --name-only --staged 2> /dev/null) ]]; then
        echo '%F{green}$(git_branch)%f'
    elif [[ -n $(git ls-files --modified 2> /dev/null) ]]; then
        echo '%F{magenta}$(git_branch)%f'
    else
        echo '$(git_branch)'
    fi
}

PROMPT='$(machine_info)%B%F{green}$(current_pwd)%f%b '
