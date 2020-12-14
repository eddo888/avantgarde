#!/usr/bin/env bash

echo "starting zookeeper"
screen -dmS 'zookeeper' ./start-zookeeper.sh
sleep 5

echo "starting kafka"
screen -dmS 'kafka' ./start-kafka.sh
sleep 5

#echo "starting subscriber"
#screen -S 'subscriber' ./subscribe-to-queue.sh

pushd ~/git/github.com/eddo888/avantgarde/
./consumer.py
popd
