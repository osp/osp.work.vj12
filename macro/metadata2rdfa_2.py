#! /usr/bin/python2.7
# -*- coding : utf8 -*-

import os
import sys
from subprocess import Popen, PIPE
import sys

folder = sys.argv[1]
output = ""

src_big_img = "../static/img/macro/"
src_small_img = "../static/img/macro-x"

for (i, filename) in enumerate(os.listdir(folder)):
    if filename != ".comments":
        attributes = ""
        metadata = Popen(["./get_metadata.sh", folder + "/" + filename], 
                         stdout=PIPE).communicate()[0]
        metadata = metadata.split("\n")

        for data in metadata:
            if data: 
                data = data.split(" ")
                if data[1] != '0':
                    attributes += '\n    data-%s="%s"' % (data[0].lower(), data[1])
        html = """<li id="item_%d"\n    data-id="%d" %s>
    <a href="%s/%s">
        <img src="%s/%s" width="160" height="220"/>
    </a>
</li>
""" % (i, i, attributes, src_big_img, filename, src_small_img, filename)
        output += html

print(output)
