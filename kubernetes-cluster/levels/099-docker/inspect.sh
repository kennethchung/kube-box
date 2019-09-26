#!/bin/bash

if command -v docker >/dev/null 2>&1; then
    return 1
else
    return 0
fi