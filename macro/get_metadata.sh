#! /bin/bash


exiv2 -P EI "$1" | tr -s " " | cut -d " " -f 1,4- | cut -d "." -f 3




