#!/bin/bash 
var1=pwd
cd $1
du -a -h --max-depth=1 | sort -hr

