#!/bin/bash 
sudo more ~/.bash_history |sort|uniq -c|sort -nr|head -11

