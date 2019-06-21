# Python virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects

if [ -f /usr/bin/virtualenvwrapper_lazy.sh ]
then
    source /usr/bin/virtualenvwrapper_lazy.sh
else
    echo "Virtualenvwrapper not found"
fi

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]
then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    echo "Zsh sytax highlight missing"
fi

if [ -f ~/.fzf/shell/completion.zsh ] && [ -f ~/.fzf/shell/key-bindings.zsh ]
then
    if which fd > /dev/null; then
        export FZF_DEFAULT_COMMAND='fd --type f'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_C_COMMAND='fd --type d'
    fi
    source ~/.fzf/shell/completion.zsh
    source ~/.fzf/shell/key-bindings.zsh
else
    echo "fzf not installed"
fi

