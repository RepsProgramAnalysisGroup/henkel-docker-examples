#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# syntax:
# docker build -t <TAG> -f <FILE> <CONTEXT-DIRECTORY>
docker build -t jjhenkel/docker-demo:ocaml -f "${DIR}/Dockerfile" ${DIR}
# <FILE> defaults to ./Dockerfile

docker run -it --rm jjhenkel/docker-demo:ocaml
  # '-i' keeps STDIN open and allows for piping (stands for interative mode).
  # '-t' allocates a pseudo terminal (hence -t). Makes interacting easier.
  # '--rm' removes this container when it exits.
  # 'jjhenkel/docker-demo:ocaml' the docker IMAGE to base the CONTAINER on.
