#!/usr/bin/env bash

if [ -z "$KAFKA_HOME" ] || [ ! -d "$KAFKA_HOME" ]
then
	echo "can't find \$KAFKA_HOME=$KAFKA_HOME"
	exit 1
fi

declare -a scripts

scripts=(
	start.sh
	start-kafka.sh
	start-zookeeper.sh
	status.sh
	create-queue.sh
	describe-queue.sh
	subscribe-to-queue.sh
	publish-to-queue.sh
	stop.sh
)

pwd=$(pwd)

pushd $KAFKA_HOME

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
