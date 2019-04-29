FROM python:3.7-stretch

# don't forget that python:3.7-stretch is just a docker image
# with (possibly) it's own base image. In this case,
# I know python:3.7-stretch is based on Debian stretch (which is 
# hinted at by the tag name '3.7-stretch')

# to figure things like this out Docker Hub (the public docker image 
# repository) is a useful place to look (and it's also where docker pulls 
# base images from, by default, if their not local and have no repo prefix)
# https://hub.docker.com/_/python

# because we now know we're working with debian, we can go ahead and 
# do things like 'apt-get install'
RUN apt-get update && apt-get install -y graphviz

RUN pip3 install numpy

ENTRYPOINT [ "bash" ]