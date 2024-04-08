#! /usr/bin/env bash

function runme() {
    # set -x # verbose-mode

    python -m pip install --upgrade pip
    pip3 install -e .
    pip3 install -r requirements.txt

    pushd ../../../ >/dev/null

    git clone https://github.com/kamangir/awesome-bash-cli.git

    cd awesome-bash-cli
    pip3 install -e .
    pip3 install -r requirements.txt
    source ./bash/abcli.sh ~terraform

    popd >/dev/null

    giza test "$@"

    return
}

runme "$@"
