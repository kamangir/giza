#! /usr/bin/env bash

function giza() {
    local task=$1

    if [ "$task" == "help" ]; then
        giza version \\n

        giza_digest "$@"
        giza_update_pdf "$@"

        if [ "$(abcli_keyword_is $2 verbose)" == true ]; then
            python3 -m giza --help
        fi

        return
    fi

    local function_name=giza_$task
    if [[ $(type -t $function_name) == "function" ]]; then
        $function_name "${@:2}"
        return
    fi

    if [ "$task" == "init" ]; then
        abcli_init giza "${@:2}"
        return
    fi

    if [ "$task" == "version" ]; then
        abcli_log "🔻 $(python3 -m giza version --show_description 1)${@:2}"
        return
    fi

    python3 -m giza \
        "$task" \
        "${@:2}"
}
