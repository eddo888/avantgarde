#!/usr/bin/env python3

import os, re, sys, json

from kafka import KafkaConsumer
from Perdy.pretty import prettyPrintLn

consumer = KafkaConsumer(bootstrap_servers='voldemort:9092')
consumer.subscribe(['quickstart-events'])

for message in consumer:
	text = message.value.decode('utf8')
	d = json.loads(text)
	prettyPrintLn(d)


		  
