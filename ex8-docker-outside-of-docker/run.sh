#!/bin/bash

# the trick here is mounting the docker unix socket (on the host) to the same
# path within the container. Also, we use an image here from the docker team
# (that image is called 'docker' which makes this command look a little confusing)
# this enables us to run docker... inside of docker.
docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock docker sh
