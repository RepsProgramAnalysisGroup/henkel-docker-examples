#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mkdir -p ${DIR}/neo4j-data

# syntax:
# docker build -t <TAG> -f <FILE> <CONTEXT-DIRECTORY>
docker build -t jjhenkel/docker-demo:neo4j -f "${DIR}/Dockerfile" ${DIR}
# <FILE> defaults to ./Dockerfile

docker run -it --rm --network host -e NEO4J_AUTH=none -v ${DIR}/neo4j-data:/data jjhenkel/docker-demo:neo4j
  # '-i' keeps STDIN open and allows for piping (stands for interative mode).
  # '-t' allocates a pseudo terminal (hence -t). Makes interacting easier.
  # '--rm' removes this container when it exits.
  # '-network host' 
  #    you could also just use '--network host' exposes the host's network to the container completely. 
  # '-e PASSWORD=demo'
  #    Sets the environment varaible 'PASSWORD' to the string 'demo'. Has the 
  #    same effect as running the container, and (before doing whatever you plan to 
  #    do) running `export PASSWORD=demo`.
  # '-v ${DIR}/noe4j-data:/data'
  #    This is the 'volume' argument. Volumes are a way to mount a directory from the HOST machine
  #    to the CONTAINER. This means that you can share data (files/directories/unix sockets) from the
  #    HOST. This comes up a lot with databases because without a volume the database would be totally
  #    ephemeral (data disappears when container exits). 
  # 'jjhenkel/docker-demo:neo4j' the docker IMAGE to base the CONTAINER on.
