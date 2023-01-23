#! /usr/bin/env bash

function giza() {
    local task=$(abcli_unpack_keyword $1 help)

    if [ $task == "help" ] ; then
        abcli_show_usage "giza digest [<application-1+application-2>|all]" \
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
        abcli_help > $abcli_object_path/usage.sh

        python3 -m giza \
            digest \
            --list_of_applications $(abcli_clarify_input $2 all) \
            --input_filename $abcli_object_path/usage.sh \
            --output_filename $abcli_object_path/abstraction.dot \
            ${@:3}
        return
    fi

    python3 -m giza \
        $task \
        ${@:2}
}