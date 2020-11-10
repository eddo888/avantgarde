#!/usr/bin/env bash

screen -dmS 'zookeeper' ./start-zookeeper.sh
screen -dmS 'kafka' ./start-kafka.sh
