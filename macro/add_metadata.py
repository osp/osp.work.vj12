#! /usr/bin/python2.7
# -*- coding : utf8 -*-


import os

folder = os.getcwd() + "/scans"
file = open("data.csv", "r")
datas = file.readlines()
file.close()

csv = []
for data in datas:
    csv.append(data.split(","))
#print csv

filenames = os.listdir(folder)
filenames = sorted(set(filenames))

i = 0

for filename in filenames:
    if filename != ".comments":
        nb = filename.split("-")[0]
        print nb, csv[i]
        if nb == csv[i][0]:
            date = csv[i][1]
            lang =  csv[i][2]
            micro =  csv[i][3]
            objectname = csv[i][4]
            source =  csv[i][5]
            destination = csv[i][6]
            description = csv[i][7].strip("\n")
            cmd = 'exiv2 -M "set Exif.Image.DateTime Ascii %s 00:00:00" -M "set Iptc.Application2.Language String %s" -M "set Iptc.Application2.Keywords String %s" -M "set Iptc.Application2.ObjectName String %s" -M "set Iptc.Application2.Source String %s" -M "set Iptc.Envelope.Destination String %s" -M "set Iptc.Application2.Caption String %s" scans/%s' % (date, lang, micro, objectname, source, destination, description, filename)
            print cmd
            os.system(cmd)
            i += 1
