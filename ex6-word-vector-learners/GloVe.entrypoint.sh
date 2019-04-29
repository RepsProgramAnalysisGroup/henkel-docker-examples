#!/bin/bash

# Adapted from GloVe's demo.sh
mkdir -p /output

# Fixed locations
VOCAB_FILE=/tmp/vocab.txt
COOCCURRENCE_FILE=/tmp/cooccurrence.bin
COOCCURRENCE_SHUF_FILE=/tmp/cooccurrence.shuf.bin
BUILDDIR=/
SAVE_FILE=/tmp/vectors

# Input params
CORPUS=$1
VOCAB_MIN_COUNT=0
VECTOR_SIZE=100
WINDOW_SIZE=5
MAX_ITER=100
NUM_THREADS=$(getconf _NPROCESSORS_ONLN)

# Constant params
MEMORY=256.0
VERBOSE=2
BINARY=0
X_MAX=0

gzip -cd $CORPUS | $BUILDDIR/vocab_count \
  -min-count $VOCAB_MIN_COUNT \
  -verbose $VERBOSE \
  > $VOCAB_FILE

gzip -cd $CORPUS | $BUILDDIR/cooccur \
  -memory $MEMORY \
  -vocab-file $VOCAB_FILE \
  -verbose $VERBOSE \
  -window-size $WINDOW_SIZE \
  > $COOCCURRENCE_FILE

$BUILDDIR/shuffle \
  -memory $MEMORY \
  -verbose $VERBOSE \
  < $COOCCURRENCE_FILE \
  > $COOCCURRENCE_SHUF_FILE

time $BUILDDIR/glove \
  -save-file $SAVE_FILE \
  -threads $NUM_THREADS \
  -input-file $COOCCURRENCE_SHUF_FILE \
  -x-max $X_MAX \
  -iter $MAX_ITER \
  -vector-size $VECTOR_SIZE \
  -binary $BINARY \
  -vocab-file $VOCAB_FILE \
  -verbose $VERBOSE

python -m gensim.scripts.glove2word2vec -i $SAVE_FILE.txt -o /output/vectors.txt