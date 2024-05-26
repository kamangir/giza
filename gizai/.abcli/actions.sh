#! /usr/bin/env bash

function giza_action_git_before_push() {
    [[ "$(abcli_git get_branch)" == "main" ]] &&
        giza pypi build
}
