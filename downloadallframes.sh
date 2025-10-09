#!/bin/bash

# This script gathers the full history of the example.png from repository, and create git animation as timelapse.gif

# Proudly modified by MaJaNames "Fraise". Thank you patrick11514.

mkdir -p frames

rm -f frames/*.png
# read -t 5 -p "Please enter the amount of last X frames to be saved.(default: 100, 5s timeout)" AMOUNT
AMOUNT=1000

i=0
for h in $(git log --follow --format=%H -n $AMOUNT -- example.png | tac); do
    git show "$h:./example.png" > "frames/$(printf "%04d" $i).png"
    i=$((i + 1))
done