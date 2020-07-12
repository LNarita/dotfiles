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

