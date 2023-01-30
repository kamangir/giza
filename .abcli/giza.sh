#! /usr/bin/env bash

function giza() {
    local task=$(abcli_unpack_keyword $1 help)

    if [ $task == "help" ] ; then
        abcli_show_usage "giza digest$ABCUL[<application-1+application-2>|all]$ABCUL[publish]" \
            "digest applications."

        if [ "$(abcli_keyword_is $2 verbose)" == true ] ; then
            python3 -m giza --help
        fi

        return
    fi

    local function_name=giza_$task
    if [[ $(type -t $function_name) == "function" ]] ; then
        $function_name "${@:2}"
        return
    fi

    if [ "$task" == "digest" ] ; then
        local options=$3
        local do_publish=$(abcli_option_int "$options" publish 0)

        abcli_help > $abcli_object_path/giza.txt

        python3 -m giza \
            digest \
            --list_of_applications $(abcli_clarify_input $2 all) \
            --input_filename $abcli_object_path/giza.txt \
            --output_filename $abcli_object_path/giza.dot \
            ${@:4}

        fdp -Tpng \
            -o $abcli_object_path/giza.png \
            $abcli_object_path/giza.dot

        fdp -Tsvg \
            -o $abcli_object_path/giza.svg \
            $abcli_object_path/giza.dot

        if [ "$do_publish" == 1 ] ; then
            cp -v \
                $abcli_object_path/giza.png \
                $abcli_object_path/giza.svg \
                $abcli_path_git/giza/
        fi

        return
    fi

    python3 -m giza \
        $task \
        ${@:2}
}