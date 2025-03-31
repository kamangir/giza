#! /usr/bin/env bash

function test_giza_help() {
    local options=$1

    local module
    for module in \
        "giza" \
        "giza build" \
        "giza open_pdf"; do
        abcli_eval ,$options \
            bluer_ai_help $module
        [[ $? -ne 0 ]] && return 1

        abcli_hr
    done

    return 0
}
