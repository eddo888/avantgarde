#!/usr/bin/env bash

bin/kafka-console-consumer.sh --topic quickstart-events --from-beginning --bootstrap-server voldemort:9092
#This is my first event
#This is my second event
