#! /usr/bin/env bash

function build_push() {
  TAG=$1
  docker build -t ajaymahto01/fluentd-s3:${TAG} .
  docker push ajaymahto01/fluentd-s3:$TAG
}

if [ -z "$1" ]; then
	echo "Usage: ./build.sh <IMAGE_TAG>"
else
	build_push $1
fi
