#! /usr/bin/env bash

export GIZA_PUBLISHED_OBJECT=giza-v1

function giza_build() {
    local options=$1
    local do_dryrun=$(abcli_option_int "$options" dryrun 0)
    local do_build=$(abcli_option_int "$options" build $(abcli_not $do_dryrun))
    local do_download=$(abcli_option_int "$options" download $(abcli_not $do_dryrun))
    local do_publish=$(abcli_option_int "$options" publish $(abcli_not $do_dryrun))
    local do_upload=$(abcli_option_int "$options" upload $(abcli_not $do_dryrun))

    local latex_options=$2

    local object_name=$GIZA_PUBLISHED_OBJECT
    local object_path=$ABCLI_OBJECT_ROOT/$object_name
    mkdir -pv $object_path

    [[ "$do_download" == 1 ]] &&
        abcli_download - $object_name

    abcli_eval dryrun=$do_dryrun \
        python3 -m gizai.tex build \
        --filename $abcli_path_git/giza/tex/revision.tex

    [[ "$do_build" == 1 ]] &&
        abcli_latex build dryrun=$do_dryrun,bib=giza,$latex_options \
            $abcli_path_git/giza/tex/giza.tex

    mv -v \
        $abcli_path_git/giza/tex/*.pdf \
        $object_path

    [[ "$do_upload" == 1 ]] &&
        abcli_upload - $object_name

    [[ "$do_publish" == 1 ]] &&
        abcli_publish \
            ~download,suffix=.pdf \
            $object_name

    return 0
}
