#! /usr/bin/env bash

function runme() {
    local git_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
    for i in {1..3}; do
        git_root=$(dirname $git_root)
    done

    echo "git_root: $git_root"

    echo "🪄"
    return
}

runme "$@"
