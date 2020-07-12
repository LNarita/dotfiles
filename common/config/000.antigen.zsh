## --== Antigen Config
source ~/.antigen.zsh

## --== Load plugins
antigen bundle robbyrussell/oh-my-zsh lib/
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle command-not-found
antigen bundle pip
antigen bundle pyenv
antigen bundle johanhaleby/kubetail

## --== Set theme | prompt
RUNNING_TERM=$(ps -o 'cmd=' -p $(ps -o 'ppid=' -p $$) | grep -Eo "[^ ]+" | head -1)
if [ "$RUNNING_TERM" != "xterm" ]; then
    antigen theme romkatv/powerlevel10k
else
    PS1='%(?.%F{green}.%F{red})%#%f '
    RPS1='[%B%F{blue}%~%f%b]'
fi

## --== Finish antigen configuration
antigen apply

