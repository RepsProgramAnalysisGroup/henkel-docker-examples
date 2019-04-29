FROM python:3.7-stretch

# the default entrypoint for python is 
# to open up the interpreter but you 
# might not want that. So you could override 
# it by using 'ENTRYPOINT' or setting the '--entrypoint'
# flag when you do `docker run`
ENTRYPOINT [ "bash" ]