#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# syntax:
# docker build -t <TAG> -f <FILE> <CONTEXT-DIRECTORY>
docker build -t jjhenkel/docker-demo:rstudio -f "${DIR}/Dockerfile" ${DIR}
# <FILE> defaults to ./Dockerfile

docker run -it --rm -p 8888:8787 -e PASSWORD=demo jjhenkel/docker-demo:rstudio
  # '-i' keeps STDIN open and allows for piping (stands for interative mode).
  # '-t' allocates a pseudo terminal (hence -t). Makes interacting easier.
  # '--rm' removes this container when it exits.
  # '-p 8787:8888' 
  #    Binds port 8787 in the container to port 8888 on the host.
  #    you could also just use '--network host' to expose the hosts
  #    network to the container completely. 
  # '-e PASSWORD=demo'
  #    Sets the environment varaible 'PASSWORD' to the string 'demo'. Has the 
  #    same effect as running the container, and (before doing whatever you plan to 
  #    do) running `export PASSWORD=demo`.
  # 'jjhenkel/docker-demo:rstudio' the docker IMAGE to base the CONTAINER on.
