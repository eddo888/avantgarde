#!/usr/bin/env bash

screen -dmS 'zookeeper' ./start-zookeeper.sh
sleep 5
screen -dmS 'kafka' ./start-kafka.sh
