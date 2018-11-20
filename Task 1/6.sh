#!/bin/bash
umask 007
#removing blank spaces
sed '/^$/d' algorithm.txt > a.txt

#getting line numbers of '**' and filling it in an array
(grep -o -n '^**' a.txt) > f.txt
cat f.txt | cut -d ':' -f1 > q.txt
readarray -t a < q.txt

#between every two '**' making directories, creating questions for every '-'except last set
for ((i=0; i<${#a[*]}; i++))
do
var=${a[$i]}
var1=${a[$i+1]}
name=$(sed 's/[^ ]* //' a.txt| sed -n "$var"p)
#echo $name
sudo mkdir /home/p1/Teaching_Material/"$name"
k=1
for ((j=var+1; j<var1; j++))
do   
sed -n "$j"p a.txt|grep '^-'> /home/p1/Teaching_Material/"$name"/q$k.txt
let k++
done
done

#creating files for last set
len=$(wc -l < a.txt)
k=1
for((j=var+1;j<=len;j++))
do
sed -n "$j"p a.txt|grep '^-' > /home/p1/Teaching_Material/"$name"/q$k.txt
let k++
done

#removing temporary files created
rm -r q.txt
rm -r f.txt
rm -r a.txt

#/home/p1/Teaching_Material/
