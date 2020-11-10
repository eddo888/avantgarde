#!/usr/bin/env bash

bin/kafka-topics.sh --describe --topic quickstart-events --bootstrap-server localhost:9092
#Topic:quickstart-events  PartitionCount:1    ReplicationFactor:1 Configs:
#    Topic: quickstart-events Partition: 0    Leader: 0   Replicas: 0 Isr: 0
