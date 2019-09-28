#!/bin/bash

dirs_install_order=("$(find ./steps  -maxdepth 1  -type d  | sort)")
for dir in "${dirs_install_order[@]}"
do
    folderName=$(basename "${dir}")
    if [ -f "./steps/${folderName}/go.sh" ]; then
        pushd "./steps/${folderName}" || exit
        # shellcheck disable=SC1091
        source ./go.sh
        popd || exit
    fi
done

