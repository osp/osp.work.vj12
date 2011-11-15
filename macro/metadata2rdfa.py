#! /usr/bin/python2.7
# -*- coding : utf8 -*-

import os
import sys
from subprocess import Popen, PIPE

folder = os.getcwd() + "/scans"
print folder
output = ""
i = 0

for filename in os.listdir(folder):
    if filename != ".comments":
        print filename
        rdfa = ""
        #cmd = 'exiv2 -P I "%s" | tr -s " " | cut -d " " -f 1,4- | cut -d "." -f 3' % filename
        metadata = Popen(["./get_metadata.sh", folder + "/" +filename], stdout=PIPE).communicate()[0]
        metadata = metadata.split("\n")

        for data in metadata:
            if data: 
                data = data.split(" ")
                if data[1] != '0':
                    rdfa += "data-%s='%s' " % (data[0].lower(), data[1])
        html = "<li data-id='%d' %s style='left: %dpx'><a rel='%s-big/%s' rel='VJ12-docs'><div class='infos'>%s</div><img src='%s/%s'/></a></li>\n" % (i, rdfa, i*10, "scans/", filename, rdfa, "scans-small/", filename)
        output += html
        i += 1


f1 = open("macro-head.html", "r")
header = f1.read();
f1.close()

f = open("macro.html", "w")
f.write(header + "<ul>\n" + output + "\n</ul>\n</div>\n</body>\n</html>")
f.close()
