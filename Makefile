.DEFAULT_GOAL := build

MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
ROOT_DIR := $(dir $(MAKEFILE_PATH))
OS_NAME := $(shell uname -s)

owner := $(shell whoami)
group := $(shell id -gn)

default: build

.PHONY: build

build:
	docker-compose build

rebuild:
	docker-compose down -v
	docker-compose build 

start:
	docker-compose up -d
	@echo "JupyterLab running on: http://localhost:8888/lab"

start-gpu:
	docker-compose stop
	docker run --gpus all --rm -p 8888:8888 -v $(ROOT_DIR)/projects:/tf  tensorflow/tensorflow:latest-gpu-jupyter

restart:
	docker-compose down
	docker-compose up -d
	@echo "JupyterLab running on: http://localhost:8888/lab"

pip-packages:
	docker-compose exec jupyter python -m pip install -r /home/requirements.txt
	
