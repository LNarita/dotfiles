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
    antigen bundle mafredri/zsh-async
    antigen bundle sindresorhus/pure
else
    PS1='%(?.%F{green}.%F{red})%#%f '
    RPS1='[%B%F{blue}%~%f%b]'
fi

## --== Finish antigen configuration
antigen apply

## --== User Env Config
VPN_CONFIG="$HOME/movile/vpn"

DEV_TOOLS_PATH="$HOME/dev-tools"
JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
MAVEN_HOME="$DEV_TOOLS_PATH/maven"
PYENV_ROOT="$DEV_TOOLS_PATH/pyenv"
RBENV_ROOT="$DEV_TOOLS_PATH/rbenv"
NVM_DIR="$DEV_TOOLS_PATH/nvm"
LEIN_SCRIPT="$DEV_TOOLS_PATH/leiningen/"
JAVA_CMD="$JAVA_HOME/bin/java"
ANACONDA_ROOT="$DEV_TOOLS_PATH/anaconda3"
YTB_DL="$HOME/app/youtube-dl"
CUSTOM_SCRIPTS_PATH="$DEV_TOOLS_PATH/bin/"
export DOCKER_COMPOSE_LOCATION=`whence docker.compose`
export DOCKER_LOCATION=`whence docker`

export JAVA_HOME
export PYENV_ROOT
export RBENV_ROOT
#export NVM_DIR
#export JAVA_CMD

PATH="$CUSTOM_SCRIPTS_PATH:$JAVA_HOME/bin:$YTB_DL:$ANACONDA_ROOT/bin:$RBENV_ROOT/bin:$PYENV_ROOT/bin:$PATH"

export PATH
command -v pyenv >/dev/null && eval "$(pyenv init -)"
command -v rbenv >/dev/null && eval "$(rbenv init -)"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

export EDITOR=/usr/bin/vim
export VISUAL="$EDITOR"

# SSH keys
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-eval-file
    eval "$(<~/.ssh-agent-eval-file)"
fi

added_keys=$(ssh-add -l)
for f in $(find ~/.ssh/ -not -name "*.pub" -a -iname "id_rsa*"); do
    [[ -s $f ]] && [[ -z $(echo $added_keys | grep -o "$f") ]] && ssh-add "$f";
done

if [[ -d $HOME/.dot_not/common/config ]]; then
    if [[ "$(ls -A $HOME/.dot_not/common/config)" ]]; then
        for f in $HOME/.dot_not/common/config/*; do [[ -s $f ]] && source "$f"; done
    fi
fi

if [[ -d $HOME/.dot_not/$WORKING_ENVIRONMENT/config ]]; then
    if [[ "$(ls -A $HOME/.dot_not/$WORKING_ENVIRONMENT/config)" ]]; then
        for f in $HOME/.dot_not/$WORKING_ENVIRONMENT/config/*; do [[ -s $f ]] && source "$f"; done
    fi
fi

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lucy.narita/dev-tools/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lucy.narita/dev-tools/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lucy.narita/dev-tools/anaconda3/etc/profile.d/conda.sh"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
