FROM python:3.7

RUN apt-get update && apt-get install -y \
  git make gcc g++ && \
  git clone https://github.com/stanfordnlp/glove.git /glove-src && \
  cd /glove-src && \
  make && \
  cp /glove-src/build/* / && \
  apt-get remove -y --auto-remove git make gcc g++ && \
  apt-get clean && \
  pip3 install gensim && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /glove-src

COPY ./GloVe.entrypoint.sh /app.sh

RUN chmod +x /app.sh

ENTRYPOINT [ "/app.sh" ]