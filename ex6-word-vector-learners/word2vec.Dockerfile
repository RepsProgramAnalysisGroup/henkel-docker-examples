FROM debian:9-slim

RUN apt-get update && apt-get install -y \
  git make gcc g++ && \
  git clone https://github.com/dav/word2vec.git /word2vec-src && \
  cd /word2vec-src && \
  make build && \
  cp /word2vec-src/bin/word2vec /word2vec && \
  apt-get remove -y --auto-remove git make gcc g++ && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /word2vec-src

COPY ./word2vec.entrypoint.sh /app.sh

RUN chmod +x /app.sh

ENTRYPOINT [ "/app.sh" ]