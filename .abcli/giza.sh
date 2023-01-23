#! /usr/bin/env bash

function giza() {
    local task=$(abcli_unpack_keyword $1 help)

    if [ $task == "help" ] ; then
        abcli_show_usage "giza digest <path_1,path_2>" \
            "digest <path_1,path_2>."

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
        echo "wip"
        return
    fi

    if [ "$task" == "version" ] ; then
        python3 -m openai_cli version
        return
    fi

    abcli_log_error "-giza: $task: command not found."
}