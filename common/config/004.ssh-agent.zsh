if ! [[ "$XDG_CURRENT_DESKTOP" =~ "GNOME" ]]; then
    # SSH keys
    if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        ssh-agent > ~/.ssh-agent-eval-file
        eval "$(<~/.ssh-agent-eval-file)"
    fi

    added_keys=$(ssh-add -l)
    for f in $(find ~/.ssh/ -not -name "*.pub" -a -iname "id_rsa*"); do
        [[ -s $f ]] && [[ -z $(echo $added_keys | grep -o "$f") ]] && ssh-add "$f";
    done
else
    echo "GNOME session, nothing to do"
fi

