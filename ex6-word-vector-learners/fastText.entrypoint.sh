#!/bin/bash

NUM_THREADS=$(getconf _NPROCESSORS_ONLN)

cat $1 | gzip -cd > /tmp/traces.txt

mkdir -p /output

time /fasttext skipgram \
    -input /tmp/traces.txt \
    -output /output/vectors.txt \
    -minn 3 \
    -maxn 6 \
    -minCount 0 \
    -dim 100 \
    -thread $NUM_THREADS \
    -epoch 5 \
    -ws 5

mv /output/vectors.txt.vec /output/vectors.txt
rm -f /output/vectors.txt.bin