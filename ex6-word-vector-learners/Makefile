SHELL=/bin/bash

# Cross-platform realpath from 
# https://stackoverflow.com/a/18443300
# NOTE: Adapted for Makefile use
define BASH_FUNC_realpath%%
() {
  OURPWD=$PWD
  cd "$(dirname "$1")"
  LINK=$(readlink "$(basename "$1")")
  while [ "$LINK" ]; do
    cd "$(dirname "$LINK")"
    LINK=$(readlink "$(basename "$1")")
  done
  REALPATH="$PWD/$(basename "$1")"
  cd "$OURPWD"
  echo "$REALPATH"
}
endef
export BASH_FUNC_realpath%%

ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: help
.PHONY: images

.DEFAULT_GOAL := help

help: ## This help.
	@grep -E \
		'^[\/\.0-9a-zA-Z_-]+:.*?## .*$$' \
		$(MAKEFILE_LIST) \
		| grep -v '<HIDE FROM HELP>' \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; \
		       {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

images: ## Build all the docker images in this directory
	docker build -t jjhenkel/docker-demo:fastText -f ${ROOT_DIR}/fastText.Dockerfile ${ROOT_DIR}
	docker build -t jjhenkel/docker-demo:GloVe -f ${ROOT_DIR}/GloVe.Dockerfile ${ROOT_DIR}
	docker build -t jjhenkel/docker-demo:word2vec -f ${ROOT_DIR}/word2vec.Dockerfile ${ROOT_DIR}