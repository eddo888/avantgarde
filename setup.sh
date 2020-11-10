#!/usr/bin/env bash

kafka_home=~/apps/kafka-2.6.0-src

pwd=$(pwd)

pushd $kafka_home

declare -a scripts

scripts=(
	create-queue.sh
	describe-queue.sh
	publish-to-queue.sh
	start-kafka.sh
	start-zookeeper.sh
	start.sh
	status.sh
	stop.sh
	subscribe-to-queue.sh
)



for script in ${scripts[@]}
do
	if [ -s $script ]
	then
		echo "= $script"
	else
		echo "+ $script"
		ln -s $pwd/$script .
	fi
done

popd
