#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# syntax:
# docker build -t <TAG> -f <FILE> <CONTEXT-DIRECTORY>
docker build -t jjhenkel/docker-demo:java -f "${DIR}/Dockerfile" ${DIR}
# <FILE> defaults to ./Dockerfile

docker run -it --rm jjhenkel/docker-demo:java
  # '-i' keeps STDIN open and allows for piping (stands for interative mode).
  # '-t' allocates a pseudo terminal (hence -t). Makes interacting easier.
  # '--rm' removes this container when it exits.
  # 'jjhenkel/docker-demo:java' the docker IMAGE to base the CONTAINER on.
