## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

install:


make:
	docker build -t duckhunt:1.0 .
	docker tag duckhunt:1.0 steeloctopus/duckhunt:2.0
	docker push steeloctopus/duckhunt:2.0

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	./hadolint Dockerfile

all: install lint test
