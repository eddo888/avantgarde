#!/usr/bin/env python3

import os, re, sys, json, xmltodict

from kafka import KafkaConsumer
from Perdy.pretty import prettyPrintLn
from Perdy.parser import printXML

consumer = KafkaConsumer(bootstrap_servers='voldemort:9092')
consumer.subscribe(['quickstart-events'])

for message in consumer:
	text = message.value.decode('utf8')
	try:
		d = json.loads(text)
		prettyPrintLn(d)
	except:
		try:
			x = xmltodict.parse(text)
			printXML(text, colour=True)
		except:
			print(text)
			


		  
