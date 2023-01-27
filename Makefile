include .env

.PHONY: init
init:
	$(eval IMAGE=${DOCKER_USER}/${IMAGE_NAME}:${PYTHON_VERSION})
	$(eval IMAGE-q=${DOCKER_USER}/${IMAGE_NAME}:${PYTHON_VERSION}q)
	$(eval IMAGE-qr=${DOCKER_USER}/${IMAGE_NAME}:${PYTHON_VERSION}qr)
	$(eval Dockerfile-Base="Dockerfile.base")
	$(eval Dockerfile-Quarto="Dockerfile.quarto")
	$(eval Dockerfile-Quarto-r="Dockerfile.quarto-r")

.PHONY: build
build: init
	docker build --build-arg PYTHON_VERSION=${PYTHON_VERSION} -f ${Dockerfile-Base} -t ${IMAGE} .

.PHONY: build-q
build-q: init
	docker build --build-arg PYTHON_VERSION=${PYTHON_VERSION} --build-arg QUARTO_VERSION=${QUARTO_VERSION} -f ${Dockerfile-Quarto} -t ${IMAGE-q} .

.PHONY: build-qr
build-qr: init
	docker build --build-arg PYTHON_VERSION=${PYTHON_VERSION} --build-arg QUARTO_VERSION=${QUARTO_VERSION} --build-arg R_VERSION=${R_VERSION} -f ${Dockerfile-Quarto-r} -t ${IMAGE-qr} .

.PHONY: shell
shell: init
	docker run -it --rm ${IMAGE}

.PHONY: shell-q
shell-q: init
	docker run -it --rm -v ${PWD}:/workdir ${IMAGE-q}

.PHONY: shell-qr
shell-qr: init
	docker run -it --rm -v ${PWD}:/workdir ${IMAGE-qr}

.PHONY: test
test: init
	docker run -it --rm -v ${PWD}/test:/workdir ${IMAGE} sh test.sh

.PHONY: test-q
test-q: init
	docker run -it --rm -v ${PWD}/test:/workdir ${IMAGE-q} sh test-q.sh 

.PHONY: test-qr
test-qr: init
	docker run -it --rm -v ${PWD}/test:/workdir ${IMAGE-qr} sh test-qr.sh 

.PHONY: push
push: init
	docker push ${IMAGE}
