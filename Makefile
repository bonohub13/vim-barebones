SHELL=/bin/bash
DOCKER_IMAGE_NAME=vim-barebones
BRANCH=$(shell date +'%Y%m%d')
USE_BRANCH=$(shell date +'%Y%m%d')
ENTRYPOINT=entrypoint.sh
ENTRYPOINT_BASE=entrypoint_base.sh

all:

build-image:
	docker build . \
		-t ${DOCKER_IMAGE_NAME}:${BRANCH} \
		-f docker/Dockerfile.${DOCKER_IMAGE_NAME}

build-ubuntu-image:
	docker build . \
		-t ${DOCKER_IMAGE_NAME}:ubuntu-${BRANCH} \
		-f docker/Dockerfile.${DOCKER_IMAGE_NAME}_ubuntu

rebuild-image:
	docker build . \
		-t ${DOCKER_IMAGE_NAME}:${BRANCH} \
		-f docker/Dockerfile.${DOCKER_IMAGE_NAME} --no-cache

rebuild-ubuntu-image:
	docker build . \
		-t ${DOCKER_IMAGE_NAME}:ubuntu-${BRANCH} \
		-f docker/Dockerfile.${DOCKER_IMAGE_NAME}_ubuntu --no-cache

run: build-image
	docker run --rm -it \
		-v "${PWD}/vim-barebones:/root/mount" \
		${DOCKER_IMAGE_NAME}:${USE_BRANCH} /bin/bash

run-ubuntu: build-ubuntu-image
	docker run --rm -it \
		-v "${PWD}/vim-barebones:/root/mount" \
		${DOCKER_IMAGE_NAME}:ubuntu-${USE_BRANCH} /bin/bash

release:
	tar czvf vim-barebones-$(shell date +'%Y%m%d').tar.gz vim-barebones

extract:
	( \
		cd ../ && tar czvf /tmp/vim-barebones-dev.tar.gz vim-barebones \
	)
	mv /tmp/vim-barebones-dev.tar.gz ./

clean-deps:
	rm -rvf vim-barebones/vim/plugged
	rm -rvf vim-barebones/vim/autoload
