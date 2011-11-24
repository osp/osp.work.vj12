#! /usr/bin/python

from BeautifulSoup import BeautifulSoup
from sys import argv


f = open(argv[1])
soup = BeautifulSoup(f.read())
f.close()

for i, node in enumerate(soup.findAll('span')):
    node['id'] = "c_%04d" % i
    node['class'] += " chunk"
    #print(node)

print(soup.prettify())
