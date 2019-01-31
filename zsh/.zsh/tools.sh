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

if [ -f /usr/share/fzf/completion.zsh ] && [ -f /usr/share/fzf/key-bindings.zsh ]
then
    export FZF_DEFAULT_COMMAND='fd --type f'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d'
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
else
    echo "fzf not installed"
fi

