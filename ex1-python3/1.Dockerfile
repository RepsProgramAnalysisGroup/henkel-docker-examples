FROM python:3.7-stretch
# pro-tip: be as specific as possible when you 
# reference a base image.

# why? because you may depend on something vauge like 
# python and then when the community switches that tag to be
# python 3.x by default instead of python 2.x your code 
# will break and that's no fun