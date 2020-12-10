# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ll='ls -ll'
alias la='ls -lAh'
alias l='ls -CF'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias emacs="emacs -nw"
alias :q="exit"
alias psg="ps auxf | grep -v grep | grep -i -e VSZ -e"
alias ggf=""

vpn() {
    echo "Connecting to VPN using config file: $VPN_CONFIG/$1.ovpn"
    sudo openvpn --config "$VPN_CONFIG/$1.ovpn" --auth-nocache --verb 6 --route-up $DEV_TOOLS_PATH/bin/fix-routes.sh;
}

git-latest-stable() {
    # Get new tags from remote
    git fetch --tags
    # Get latest tag name
    latest_tag=$(git describe --tags `git rev-list --tags --max-count=1`)
    # Checkout latest tag
    git checkout $latest_tag
}

repo() {
    env=$1
    repo_url=$2
    clone_dir=${3:-$(echo $2 | sed -E "s/^.*\/(.*)$/\1/" | sed "s/.git$//")}
    if [[ -z $repo_url ]]; then
        echo "no url found"
        return 1
    fi
    if [[ "$env" =~ "^w(ork)?" ]]; then
        echo "will clone $repo_url using work credentials" &&
        git clone $repo_url $clone_dir &&
        cd $clone_dir &&
        git config user.email "$GIT_WORK_EMAIL"
    elif [[ "$env" =~ "^p(ersonal)?" ]]; then
        echo "will clone $repo_url using personal credentials" &&
        git clone $repo_url $clone_dir &&
        cd $clone_dir &&
        git config user.email "$GIT_PERSONAL_EMAIL"
    else
        echo "invalid environment"
    fi
    echo "finished"
}

ggupdate() {
    untouched_repos=()
    error_repos=()
    for r in $(find . -maxdepth 1 -mindepth 1 -type d); do
        cd $r
        if [[ -d "./.git" ]]; then
            current_branch=$(git rev-parse --abbrev-ref HEAD)
            echo "currently in $r... $current_branch"
            if [[ "$current_branch" =~ "master|develop" ]]; then
                echo "pulling newest changes from $r"
                { git fetch && ggpull; } || error_repos+=("$r")
            else
                untouched_repos+=("$r")
            fi
        fi
        cd ..
    done
    echo "=====================\n"
    echo "untouched repositories: $untouched_repos"
    echo "=====================\n"
    echo "failed to update repositories: $error_repos"
}


md5-hash() {
    text=${1:-""}
    echo -n $text | md5sum
}
