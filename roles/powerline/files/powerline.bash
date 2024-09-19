# ---- begin powerline ----
export PLGO_HOSTNAMEFG=15
export PLGO_HOSTNAMEBG=$((16 + 4*36 + 1*6 + 0))  # r g b
export PLGO_EXTRA=""
PLGO_BINARY=$(which powerline-go)

PLGO_MODULES=("termtitle")
if [ $(id -u) = "0" ]; then
    PLGO_MODULES+=("user")
fi
if [ $(ls -di / | awk '{print $1}') != "2" ]; then
    PLGO_MODULES+=("shell-var")

    PLGO_EXTRA=$(echo $SUDO_COMMAND | awk '{print $2}' | cut -f1 -d/)
    if [ "x$PLGO_EXTRA" = "x" ]; then
        PLGO_EXTRA="chroot"
    fi
fi
PLGO_MODULES+=("host" "cwd")
PLGO_MODULES=$(echo ${PLGO_MODULES[@]} | sed 's/ /,/g')

function _update_ps1() {
    PS1="$($PLGO_BINARY --theme default --shell=bash --modules ${PLGO_MODULES} -shell-var PLGO_EXTRA -colorize-hostname -error $?)"
}
if [ -f "$PLGO_BINARY" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
# ---- end powerline ----
