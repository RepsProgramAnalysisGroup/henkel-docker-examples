FROM debian:9-slim

RUN apt-get update && apt-get install -y \
  git make gcc g++ && \
  git clone https://github.com/facebookresearch/fastText.git /fastText-src && \
  cd /fastText-src && \
  make && \
  cp /fastText-src/fasttext /fasttext && \
  apt-get remove -y --auto-remove git make gcc g++ && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /fastText-src

COPY ./fastText.entrypoint.sh /app.sh

RUN chmod +x /app.sh

ENTRYPOINT [ "/app.sh" ]