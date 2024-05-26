#! /usr/bin/env bash

function giza() {
    local task=$1
    [[ "$task" == "open" ]] && task="open_pdf"

    if [ "$task" == "help" ]; then
        giza_build "$@"
        giza_digest "$@"
        giza_open_pdf "$@"
        return
    fi

    abcli_generic_task \
        plugin=giza,task=$task \
        "${@:2}"
}
