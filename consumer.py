#!/usr/bin/env python3

import os, re, sys, json, xmltodict

from kafka import KafkaConsumer
from Perdy.pretty import prettyPrintLn
from Perdy.parser import printXML

consumer = KafkaConsumer(bootstrap_servers='192.168.1.220:9092')
consumer.subscribe(['quickstart-events'])

horizon = '_'*int(os.environ.get('COLUMNS',80))

for message in consumer:
	text = message.value.decode('utf8')
	try:
		print(horizon)
		d = json.loads(text)
		prettyPrintLn(d)
	except:
		try:
			x = xmltodict.parse(text)
			printXML(text, colour=True)
		except:
			print(text)
	print(horizon)
