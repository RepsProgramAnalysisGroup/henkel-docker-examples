#!/bin/bash

NUM_THREADS=$(getconf _NPROCESSORS_ONLN)

cat $1 | gzip -cd > /tmp/traces.txt

mkdir -p /output

time /word2vec \
    -train /tmp/traces.txt \
    -output /output/vectors.txt \
    -skipgram 5 \
    -size 100 \
    -window 5 \
    -negative 5 \
    -hs 0 \
    -sample 1e-4 \
    -threads $NUM_THREADS \
    -min-count 0 \
    -binary 0 \
    -iter 100
