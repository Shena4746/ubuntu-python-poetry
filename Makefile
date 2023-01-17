include .env

.PHONY: init
init:
	$(eval IMAGE=${DOCKER_USER}/${IMAGE_NAME}:${PYTHON_VERSION})

.PHONY: build
build: init
	docker build --build-arg PYTHON_VERSION=${PYTHON_VERSION} -t ${IMAGE} .

.PHONY: shell
shell: init
	docker run -it --rm ${IMAGE}

.PHONY: test
test: init
	docker run -it --rm -v ${PWD}/test:/workdir ${IMAGE} sh test.sh

.PHONY: push
push: init
	docker push ${IMAGE}