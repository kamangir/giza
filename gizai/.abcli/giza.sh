#! /usr/bin/env bash

function giza() {
    local task=$1
    [[ "$task" == "open" ]] && task="open_pdf"

    bluer_ai_generic_task \
        plugin=giza,task=$task \
        "${@:2}"
}

bluer_ai_log $(giza version --show_icon 1)
