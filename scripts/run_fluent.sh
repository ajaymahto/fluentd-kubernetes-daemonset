#! /usr/bin/env bash

function main() {
	# Getting TAG
	TAG=$1
	BUCKET="aj-test-bucket01"
	REGION="ap-southeast-1"
	
	# Remove existing fluentd container.
	docker ps -a | grep fluentd | awk '{print $1}' | xargs docker rm -f
	
	# Create new fluentd container.
	docker run -v /var/log:/var/log -v /var/log/docker/containers:/var/log/docker/containers -e NODE_NAME=`hostname -f` -e S3_BUCKET_NAME="${BUCKET}" -e S3_BUCKET_REGION="${REGION}" -d ajaymahto01/fluentd-s3:${TAG} --name fluentd
}

if [ -z "$1" ]; then
	echo "Usage: ./run_fluent.sh <IMAGE_TAG>"
else
	main $1
fi
