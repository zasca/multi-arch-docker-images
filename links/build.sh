#!/usr/bin/env bash

# Prerequisite
# Make sure you set secret enviroment variables in CI
# DOCKER_USERNAME
# DOCKER_PASSWORD

set -e

Usage() {
  echo "$0 [rebuild]"
}

image="alpine/links"
platform="linux/arm/v7,linux/arm64/v8,linux/arm/v6,linux/amd64,linux/ppc64le,linux/s390x" 

curl -sL "https://raw.githubusercontent.com/alpine-docker/multi-arch-libs/stable/functions.sh" -o functions.sh
source functions.sh

tag="latest"
build_arg="VERSION=${tag}"

echo "build image for ${tag}"
build_docker_image "${tag}" "${image}" "${platform}" "${build_arg}"