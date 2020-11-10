#!/usr/bin/env python3

from kafka import KafkaConsumer

consumer = KafkaConsumer(bootstrap_servers='localhost:9092')
consumer.subscribe(['quickstart-events'])

for message in consumer:
	print(message)


		  
