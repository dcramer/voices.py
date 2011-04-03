#!/bin/bash

if [ ! -d \"~/.voices\" ]; then
    mkdir ~/.voices
fi
cd ~/.voices
curl -O https://github.com/dcramer/voices.py/raw/master/voices.py > /dev/null 2>&1
screen -d -m python voices.py

# TODO: this should be optionally via a --switch
echo "if [ ! -d \"~/.voices\" ]; then
    mkdir ~/.voices
    cd ~/.voices
    curl -O https://github.com/dcramer/voices.py/raw/master/voices.py > /dev/null 2>&1
    screen -d -m python voices.py
fi" >> ~/.bash_profile