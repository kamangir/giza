#! /usr/bin/env bash

function bp() {
    blue_plugin $@
}

function blue_plugin() {
    local task=$(abcli_unpack_keyword $1 help)

    if [ $task == "help" ] ; then
        abcli_show_usage "abct task_1" \
            "run abct task_1."

        if [ "$(abcli_keyword_is $2 verbose)" == true ] ; then
            python3 -m blue_plugin --help
        fi

        return
    fi

    local function_name=blue_plugin_$task
    if [[ $(type -t $function_name) == "function" ]] ; then
        $function_name ${@:2}
        return
    fi

    if [ "$task" == "task_1" ] ; then
        python3 -m blue_plugin \
            task_1 \
            ${@:2}
        return
    fi

    abcli_log_error "-blue_plugin: $task: command not found."
}