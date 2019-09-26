#!/bin/bash

NC='\033[0m'
function printred() {
    #shellcheck disable=SC1117
    printf "\033[31m[%s] %b ${NC}\n" "$CURRENT_STEP" "$@"
}

function printgreen() {
    #shellcheck disable=SC1117
    printf "\033[32m[%s] %b ${NC}\n" "$CURRENT_STEP" "$@"
}

function printyellow() {
    #shellcheck disable=SC1117
    printf "\033[33m[%s] %b ${NC}\n" "$CURRENT_STEP" "$@"
}

