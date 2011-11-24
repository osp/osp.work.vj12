#! /usr/bin/env python2


from BeautifulSoup import BeautifulSoup
from pygments.formatters import HtmlFormatter
from pygments import highlight
from pygments.lexers import RebolLexer
from sys import argv


f = open(argv[1])
code = f.read()
f.close()

soup = highlight(code, RebolLexer(), HtmlFormatter())
soup = soup.replace('\n', '<br />')
soup = BeautifulSoup(soup)

count = 0

for node in soup.findAll(text=True):
    i = 0
    chunks = node.split()
    newString = ""
    for chunk in chunks:
        count += 1
        if i == len(chunks):
            newString += """<span id="c_%04d" class="chunk">%s</span>""" % (count, chunk)
        else:
            newString += """<span id="c_%04d" class="chunk">%s </span>""" % (count, chunk)
        i += 1
    node.replaceWith(newString)

print(str(soup).replace('<br />', '\n'))
