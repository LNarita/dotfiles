## --== Antigen Config
source ~/.antigen.zsh

## --== Load plugins
antigen bundle robbyrussell/oh-my-zsh lib/
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle command-not-found
antigen bundle pip
antigen bundle pyenv

## --== Set theme | prompt
RUNNING_TERM=$(ps -o 'cmd=' -p $(ps -o 'ppid=' -p $$) | grep -Eo "[^ ]+" | head -1)
if [ "$RUNNING_TERM" != "xterm" ]; then
    antigen bundle mafredri/zsh-async
    antigen bundle sindresorhus/pure
else
    PS1='%(?.%F{green}.%F{red})%#%f '
    RPS1='[%B%F{blue}%~%f%b]'
fi

## --== Finish antigen configuration
antigen apply

## --== User Env Config
WORKING_ENVIRONMENT="personal"
VPN_CONFIG="$HOME/movile/vpn"

DEV_TOOLS_PATH="$HOME/dev-tools"
JAVA_HOME="$DEV_TOOLS_PATH/java/jdk-1.8"
MAVEN_HOME="$DEV_TOOLS_PATH/maven"
PYENV_ROOT="$DEV_TOOLS_PATH/pyenv"

export JAVA_HOME
export PYENV_ROOT

PATH="$PYENV_ROOT/bin:$MAVEN_HOME/bin:$PATH"

export PATH
eval "$(pyenv init -)"

export EDITOR=/usr/bin/vim

if [[ -d $HOME/.dot_not/common/config ]]; then
    if [[ "$(ls -A $HOME/.dot_not/common/config)" ]]; then
        for f in $HOME/.dot_not/common/config/*; do [[ -f "$f" ]] && source "$f"; done
    fi
fi

if [[ -d $HOME/.dot_not/$WORKING_ENVIRONMENT/config ]]; then
    if [[ "$(ls -A $HOME/.dot_not/$WORKING_ENVIRONMENT/config)" ]]; then
        for f in $HOME/.dot_not/$WORKING_ENVIRONMENT/config/*; do [[ -f "$f" ]] && source "$f"; done
    fi
fi

