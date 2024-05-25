#! /usr/bin/env bash

function giza_action_git_before_push() {
    giza pypi build
}
