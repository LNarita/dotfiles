nplayer() {
    ncmpcpp
}

vscode() {
    profile=${1:-""}
    if [[ -z $profile ]]; then
        echo "profile is empty... launching vscode w/ default profile"
        code
    else
        echo "launching vscode w/ $profile config files"
        profile_dir="$CUSTOM_APP_CONFIG_DIR/vscode/$profile"
        code --extensions-dir "$profile_dir/ext" --user-data-dir "$profile_dir/data" "${@:2}"
    fi
}
