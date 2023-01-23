#! /usr/bin/env bash

function giza() {
    local task=$(abcli_unpack_keyword $1 help)

    if [ $task == "help" ] ; then
        abcli_show_usage "giza digest [<plugin_1+plugin_2>|all]" \
            "digest plugins."

        if [ "$(abcli_keyword_is $2 verbose)" == true ] ; then
            python3 -m giza --help
        fi

        return
    fi

    local function_name=giza_$task
    if [[ $(type -t $function_name) == "function" ]] ; then
        $function_name ${@:2}
        return
    fi

    if [ "$task" == "digest" ] ; then
        python3 -m giza \
            digest \
            --what $(abcli_clarify_input $2 all) \
            ${@:3}
        return
    fi

    python3 -m giza \
        $task \
        ${@:2}
}