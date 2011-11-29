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
        html = """<li data-id="%d" %s>
    <a href="%s/%s">
        <img src="%s/%s"/>
    </a>
</li>
""" % (i, attributes, src_big_img, filename, src_small_img, filename)
        output += html

print(output)


#f1 = open("macro-head.html", "r")
#header = f1.read();
#f1.close()

#f = open("macro.html", "w")
#f.write(header + "<ul>\n" + output + "\n</ul>\n</div>\n</body>\n</html>")
#f.close()
