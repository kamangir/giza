#! /usr/bin/env bash

export GIZA_PUBLISHED_OBJECT=giza-v1

function giza_build() {
    local options=$1
    local do_dryrun=$(bluer_ai_option_int "$options" dryrun 0)
    local do_build=$(bluer_ai_option_int "$options" build $(bluer_ai_not $do_dryrun))
    local do_upload=$(bluer_ai_option_int "$options" upload $(bluer_ai_not $do_dryrun))
    local do_download=$(bluer_ai_option_int "$options" download $do_upload)
    local do_push=$(bluer_ai_option_int "$options" push 0)

    local latex_options=$2

    local object_name=$GIZA_PUBLISHED_OBJECT
    local object_path=$ABCLI_OBJECT_ROOT/$object_name
    mkdir -pv $object_path

    [[ "$do_download" == 1 ]] &&
        bluer_objects_download - $object_name

    bluer_ai_eval dryrun=$do_dryrun \
        python3 -m gizai.tex build \
        --filename $abcli_path_git/giza/tex/revision.tex
    [[ $? -ne 0 ]] && return 1

    if [[ "$do_build" == 1 ]]; then
        bluer_ai_latex build dryrun=$do_dryrun,bib=giza,$latex_options \
            $abcli_path_git/giza/tex/giza.tex
        [[ $? -ne 0 ]] && return 1
    fi

    mv -v \
        $abcli_path_git/giza/tex/*.pdf \
        $object_path

    bluer_objects_mlflow_tags_set \
        $object_name \
        contains=latest-giza

    [[ "$do_upload" == 1 ]] &&
        bluer_objects_upload - $object_name

    cp -v \
        $object_path/*.pdf \
        $abcli_path_git/giza/pdf/

    [[ "$do_push" == 1 ]] &&
        bluer_ai_git giza push \
            "$(python3 -m gizai version) build"

    return 0
}
