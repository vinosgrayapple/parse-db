#!/bin/bash
SENTENCE=""
tput sc
while read word
do
    SENTENCE="$SENTENCE $word"
    tput rc
    tput hpa 20
    printf '%s\n' "$SENTENCE"
    tput sc
done