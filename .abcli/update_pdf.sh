#! /usr/bin/env bash

export giza_overleaf_url=https://www.overleaf.com/read/hhytkyyxzfck#6b2796

function giza_update_pdf() {
    local options=$1

    if [ $(abcli_option_int "$options" help 0) == 1 ]; then
        abcli_show_usage "giza update_pdf [~pull,push,~rm]" \
            "update assets/giza.pdf in https://github.com/kamangir/giza/."
        return
    fi

    local do_pull=$(abcli_option_int "$options" pull 1)
    local do_push=$(abcli_option_int "$options" push 0)
    local do_rm=$(abcli_option_int "$options" rm 1)

    [[ "$do_pull" == 1 ]] &&
        abcli_git assets pull

    local filename=$HOME/Downloads/giza.pdf
    if [[ ! -f "$filename" ]]; then
        abcli_log_error "-giza: update_pdf: giza.pdf not found, build and download from $giza_overleaf_url."
        return 1
    fi

    mkdir -pv $abcli_path_git/assets/giza
    cp -v $filename $abcli_path_git/assets/giza/giza.pdf
    [[ "$do_rm" == 1 ]] && rm -fv $filename

    if [[ "$do_push" == 1 ]]; then
        abcli_git push \
            assets \
            accept_no_issue \
            $(python3 -m giza version)
    else
        abcli_git assets status
    fi
}
