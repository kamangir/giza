#! /usr/bin/env bash

function test_giza_version() {
    local options=$1
    local do_dryrun=$(bluer_ai_option_int "$options" dryrun 0)

    bluer_ai_eval dryrun=$do_dryrun \
        "giza version ${@:2}"

    return 0
}
