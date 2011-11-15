import urllib2
import bottle
from bottle import (run, get, request, response, template, route)

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
def context():
    ptx = ""
    word = request.GET.get('word')
    if word:
        print word
        import os
        cmd = 'ptx -W %s vj12_ivan.txt' % word
        lines = os.popen(cmd)
        ptx = lines.read()
    return template('context', name=word, ptx=ptx)

run(host='localhost', port=8080)
