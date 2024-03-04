#! /usr/bin/env bash

function giza() {
    local task=$1

    if [ "$task" == "help" ]; then
        giza_digest "$@"

        local task
        for task in pylint pytest test; do
            giza $task "$@"
        done

        giza open_pdf "$@"
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

    if [[ ",open,open_pdf," == *",$task,"* ]]; then
        local options=$2
        if [ $(abcli_option_int "$options" help 0) == 1 ]; then
            abcli_show_usage "giza open|open_pdf" \
                "open giza.pdf."
            return
        fi

        abcli_eval - \
            open $abcli_path_git/assets/giza/giza.pdf
        return
    fi

    if [ "$task" == "update" ]; then
        giza_update_pdf "${@:2}"
        return
    fi

    if [[ "|pylint|pytest|test|" == *"|$task|"* ]]; then
        abcli_${task} plugin=giza,$2 \
            "${@:3}"
        return
    fi

    if [ "$task" == "version" ]; then
        python3 -m giza version "${@:2}"
        return
    fi

    python3 -m giza \
        "$task" \
        "${@:2}"
}

abcli_source_path \
    $abcli_path_git/giza/.abcli/tests
