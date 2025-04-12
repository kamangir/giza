#! /usr/bin/env bash

function giza_open_pdf() {
    local options=$1
    local do_download=$(bluer_ai_option_int "$options" download 1)
    local pdf=$(bluer_ai_option "$options" pdf giza)

    local object_name=$GIZA_PUBLISHED_OBJECT

    [[ "$do_download" == 1 ]] &&
        bluer_objects_download - $object_name

    bluer_ai_eval ,$options \
        open $ABCLI_OBJECT_ROOT/$object_name/$pdf.pdf
}
