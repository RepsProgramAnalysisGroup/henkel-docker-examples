#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# syntax:
# docker build -t <TAG> -f <FILE> <CONTEXT-DIRECTORY>
docker build -t jjhenkel/docker-demo:java -f "${DIR}/Dockerfile" ${DIR}
# <FILE> defaults to ./Dockerfile

docker run -it --rm --entrypoint bash -v $DIR:/app jjhenkel/docker-demo:java
  # '-i' keeps STDIN open and allows for piping (stands for interative mode).
  # '-t' allocates a pseudo terminal (hence -t). Makes interacting easier.
  # '--rm' removes this container when it exits.
  # '--entrypoint bash' overrides the 'ENTRYPOINT' directive.
  # '-v $DIR:/app'
  #    Here, again, we see the use of volumes. This time we are using a volume 
  #    so we can edit files locally (on the host) and then see the updates immediately
  #    in the container.
  # 'jjhenkel/docker-demo:java' the docker IMAGE to base the CONTAINER on.
