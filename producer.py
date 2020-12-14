#!/usr/bin/env python3

import re, sys, os, arrow
from kafka import KafkaProducer

producer = KafkaProducer(bootstrap_servers='voldemort:9092')
topic = 'quickstart-events'

if len(sys.argv) > 1:
	for file in sys.argv[1:]:
		with open(file,'rb') as input:
			producer.send(topic, input.read())
			producer.flush()

else:
	now=arrow.now()
	print(now.humanize())

	bits=now.format('YYYY-MM-DD HH:mm:ss ZZ').encode('utf8')
	print(bits)

	producer.send(topic, bits)
	producer.flush()
