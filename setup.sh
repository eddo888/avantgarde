#!/usr/bin/env bash

if [ -z "$KAFKA_HOME" ] || [ ! -d "$KAFKA_HOME" ]
then
	echo "can't find \$KAFKA_HOME=$KAFKA_HOME"
	exit 1
fi

pwd=$(pwd)

pushd $KAFKA_HOME

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
