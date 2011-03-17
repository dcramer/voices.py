#!/bin/bash
mkdir ~/.voices
cd ~/.voices
VOICES=$RANDOM.py
curl -O https://github.com/dcramer/voices.py/raw/master/voices.py
mv voices.py $VOICES
screen -d -m python $VOICES