alias bathelp='bat --plain --language=help'
function help() {
    "$@" --help 2>&1 | bathelp
}
function h() {
    "$@" -h 2>&1 | bathelp
}

