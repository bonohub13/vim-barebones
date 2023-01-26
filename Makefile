SHELL = /bin/bash
DOCKER_IMAGE_NAME := vim-barebones
BRANCH := $(shell date +'%Y%m%d')
USE_BRANCH := 20230125

all:

build-image:
	docker build . \
		-t ${DOCKER_IMAGE_NAME}:${BRANCH} \
		-f docker/Dockerfile.${DOCKER_IMAGE_NAME}

rebuild-image:
	docker build . \
		-t ${DOCKER_IMAGE_NAME}:${BRANCH} \
		-f docker/Dockerfile.${DOCKER_IMAGE_NAME} --no-cache

run: build-image
	docker run --rm -it \
		-v "${PWD}/vim-barebones:/home/vimuser/mount" \
		${DOCKER_IMAGE_NAME}:${USE_BRANCH} /bin/bash

release:
	tar czvf vim-barebones-$(shell date +'%Y%m%d').tar.gz vim-barebones
