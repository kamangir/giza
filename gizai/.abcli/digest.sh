#! /usr/bin/env bash

function giza_digest() {
    local options=$1

    if [ $(abcli_option_int "$options" help 0) == 1 ]; then
        abcli_show_usage "giza digest$ABCUL[dryrun,publish]$ABCUL[<application-1+application-2>|all]" \
            "digest applications."
        return
    fi

    local do_dryrun=$(abcli_option_int "$options" dryrun 0)
    local do_publish=$(abcli_option_int "$options" publish 0)

    abcli_help >$abcli_object_path/giza.txt

    python3 -m gizai.digest \
        digest \
        --list_of_applications $(abcli_clarify_input $2 all) \
        --input_filename $abcli_object_path/giza.txt \
        --output_filename $abcli_object_path/giza.dot \
        "${@:3}"

    abcli_eval dryrun=$do_dryrun \
        fdp -Tpng \
        -o $abcli_object_path/giza.png \
        $abcli_object_path/giza.dot

    abcli_eval dryrun=$do_dryrun \
        fdp -Tsvg \
        -o $abcli_object_path/giza.svg \
        $abcli_object_path/giza.dot

    [[ "$do_publish" == 1 ]] &&
        cp -v \
            $abcli_object_path/giza.png \
            $abcli_object_path/giza.svg \
            $abcli_path_git/giza/

}
