FROM python:3.7-stretch

# you might also want to install something like numpy
# you can do that too using 'RUN'
RUN pip3 install numpy

ENTRYPOINT [ "bash" ]