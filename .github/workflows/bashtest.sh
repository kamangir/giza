#! /usr/bin/env bash

function runme() {
    local git_root=$(dirname "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")
    echo "git_root: $git_root"

    echo "🪄"
    return
}

runme "$@"
