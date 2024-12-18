#! /usr/bin/env bash

function giza() {
    local task=$1
    [[ "$task" == "open" ]] && task="open_pdf"

    abcli_generic_task \
        plugin=giza,task=$task \
        "${@:2}"
}
