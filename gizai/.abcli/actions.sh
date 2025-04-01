#! /usr/bin/env bash

function giza_action_git_before_push() {
    [[ "$(bluer_ai_git get_branch)" != "main" ]] &&
        return 0

    giza pypi build
    [[ $? -ne 0 ]] && return 1

    giza build
}
