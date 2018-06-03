source ~/.zsh/checks.sh
source ~/.zsh/opts.sh
source ~/.zsh/completion.sh
source ~/.zsh/exports.sh
source ~/.zsh/functions.sh
source ~/.zsh/keys.sh
source ~/.zsh/prompt.sh
source ~/.zsh/alias.sh

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]
then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    echo "Zsh sytax highlight missing"
fi

if [ -f /usr/share/fzf/completion.zsh ] && [ -f /usr/share/fzf/key-bindings.zsh ]
then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
else
    echo "fzf not installed"
fi

