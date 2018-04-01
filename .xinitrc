#!/usr/bin/env sh


export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export _JAVA_AWT_WM_NONREPARENTING=1

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-eval-file
fi

if ! pgrep -u "$USER" fcitx > /dev/null; then
    fcitx -d
fi

wal -i ~/Pictures/wallpaper/tkn-tsurumaru.jpg -i 1B1B1B
