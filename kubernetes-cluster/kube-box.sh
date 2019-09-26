#!/bin/bash

dirs_install_order=("$(find ./levels  -maxdepth 1  -type d  | sort)")
for dir in "${dirs_install_order[@]}"
do
    folderName=$(basename "${dir}")
    if [ -f "./levels/${folderName}/go.sh" ]; then
        pushd "./levels/${folderName}" || exit
        # shellcheck disable=SC1091
        source ./go.sh
        popd || exit
    fi
done

