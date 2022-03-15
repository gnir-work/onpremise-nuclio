RUNTIME_IMAGE_NAME=test-nuclio-py-3
REGISTRY_HOST=localhost:5000

build-runtime-image:
	docker build -t ${RUNTIME_IMAGE_NAME} .

push-runtime-image: build-runtime-image start-registry
	docker push ${REGISTRY_HOST}/${RUNTIME_IMAGE_NAME}

shell:
	docker run -it ${RUNTIME_IMAGE_NAME} bash

pull-required-local-images:
	docker pull gcr.io/iguazio/alpine:3.15
	docker pull quay.io/nuclio/uhttpc:0.0.1-amd64 
	docker pull registry:2 
	docker pull quay.io/nuclio/dashboard:stable-amd64
	docker pull quay.io/nuclio/handler-builder-python-onbuild:1.7.11-amd64
	docker pull python:3.9


tag-downloadable-images: pull-required-local-images
	docker tag quay.io/nuclio/handler-builder-python-onbuild:1.7.11-amd64 ${REGISTRY_HOST}/handler-builder-python-onbuild:1.7.11-amd64
	docker tag quay.io/nuclio/dashboard:stable-amd64 ${REGISTRY_HOST}/nuclio/dashboard:stable-amd64
	docker tag python:3.9 ${REGISTRY_HOST}/python:3.9

push-downloadable-images: tag-downloadable-images start-registry
	docker push ${REGISTRY_HOST}/handler-builder-python-onbuild:1.7.11-amd64
	docker push ${REGISTRY_HOST}/nuclio/dashboard:stable-amd64
	docker push ${REGISTRY_HOST}/python:3.9


setup-local-registry: push-downloadable-images

start-registry:
	docker-compose up -d registry

start-nuclio:
	docker-compose up -d nuclio-dashboard

start: start-registry start-nuclio 
