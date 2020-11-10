#!/usr/bin/env python3

import re, sys, os, arrow
from kafka import KafkaProducer

producer = KafkaProducer(bootstrap_servers='localhost:9092')

now=arrow.now()
print(now.humanize())

bits=now.format('YYYY-MM-DD HH:mm:ss ZZ').encode('utf8')
print(bits)

producer.send('quickstart-events', bits)
producer.flush()
