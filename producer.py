#!/usr/bin/env python3

import re, sys, os, arrow
from kafka import KafkaProducer

producer = KafkaProducer(bootstrap_servers='localhost:9092')

now=arrow.now()
print(now)

producer.send('quickstart-events', now.toISOString())
