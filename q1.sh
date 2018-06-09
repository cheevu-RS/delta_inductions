#!/bin/bash
wget https://delta.nitt.edu/~shubham/web_logs.txt
awk '{ print $2 }' web_logs.txt |sort | uniq -c  | sort -nr| head -20


