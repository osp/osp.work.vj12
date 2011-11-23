# -*- coding: utf-8 -*-
import urllib2
import bottle
from string import replace
from bottle import (run, get, request, response, template, route, static_file)
from json import dumps

bottle.debug(True)

@get('/proxy/')
def proxy():
    url = request.GET.get('url')
    response = urllib2.urlopen(url)
    return response.read()

@get('/')
def home():
    return template('hello')

@route('/context')
@route('/context/:word')
def context(word = False):
    ptx = ''
    if word:
        print word
        import os
        cmd = 'ptx -W %s vj12_ivan.txt' % word
        lines = os.popen(cmd)
        ptx = lines.read()
    return template('context', name=word, ptx=ptx)

@route('/overview')
def overview():
    return template('overview',files = '["the-man-pages", "to-talk-of-many-things"]')
    
@route('/text/:filename')
def text(filename):
    filename = 'texts/%s.txt' % replace (filename, '-', '_')
    file = {'name': replace (filename, '-', ' '), 'data': None}
    
    with open (filename, 'r') as f:
        file['data'] = f.read()
    f.closed
    
    return dumps (file)

run(host = 'localhost', port = 8080)
