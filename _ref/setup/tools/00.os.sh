#!/bin/bash

__guard() {
    local f="${1:?Missing argument}";
    eval local ff="\$$f";
    [[ $ff ]];
    return $?;
}
__echo() {
    local f="${1:?Missing argument}";
    eval local ff="\$$f"
    echo $ff;
}

get_kernel() {
    __guard ${FUNCNAME} && __echo ${FUNCNAME} && return;
    IFS=" " read get_kernel get_kernel_version get_kernel_machine <<< "$(uname -srm)"
    __echo ${FUNCNAME};
}

get_kernel_version() {
    __guard ${FUNCNAME} && __echo ${FUNCNAME} && return;
    IFS=" " read get_kernel get_kernel_version get_kernel_machine <<< "$(uname -srm)"

    __echo ${FUNCNAME};
}

get_kernel_machine() {
    __guard ${FUNCNAME} && __echo ${FUNCNAME} && return;
    IFS=" " read get_kernel get_kernel_version get_kernel_machine <<< "$(uname -srm)"

    __echo ${FUNCNAME};
}

get_darwin_name() {
    __guard ${FUNCNAME} && __echo ${FUNCNAME} && return;
    if [[ "$(get_kernel)" == "Darwin" ]]; then
        # TODO: get Mac OS name
        get_darwin_name="TODO";
    else
        get_darwin_name="Not on Darwin";
    fi
    __echo ${FUNCNAME};
}

get_linux_os() {
    __guard ${FUNCNAME} && __echo ${FUNCNAME} && return;
    local release_files=("/etc/lsb-release" "/usr/lib/os-release" "/etc/os-release" "/etc/openwrt_release");
    for file in ${release_files[@]}; do
        if [[ -e $file ]]; then
            while IFS='=' read -r key val
            do
                val=${val%\"}
                val=${val#\"}

                case "$key" in
                    ID) get_linux_os="$(echo $val | tr '[:upper:]' '[:lower:]')" ;;
                    PRETTY_NAME) get_distro_pretty_name="$val" ;;
                    NAME) get_distro_name="$val" ;;
                esac
            done < $file
            __guard ${FUNCNAME} && __echo ${FUNCNAME} && return;
        fi
    done
    get_linux_os="Not supported";
    __echo ${FUNCNAME};
}

get_os() {
    __guard ${FUNCNAME} && __echo ${FUNCNAME} && return;

    case $(get_kernel) in
        Darwin)                get_os="$(get_darwin_name)" ;;
        Linux|GNU*)            get_os="$(get_linux_os)"    ;;
        *BSD|DragonFly|Bitrig) get_os="bsd"                ;;
        CYGWIN*|MSYS*|MINGW*)  get_os="windows"            ;;
        *)                     get_os="$(echo "$(get_kernel)" | tr '[:upper:]' '[:lower:]')" ;;
    esac

    __echo ${FUNCNAME};
}
