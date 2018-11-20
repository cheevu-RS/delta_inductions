#!/bin/bash
sudo find /home/p1/Teaching_Material -type f > q.txt #part of next segment
len=$(wc -l < q.txt)
echo len= $len
sudo find /home/p2/Teaching_Material -type f > p.txt 
len1=$(wc -l < p.txt) 
echo len= $len1 # till here

for i in {1..20}
do
#removing old hw 
sudo rm -rf /home/s$i/HomeWork/prof1_work/*
sudo rm -rf /home/s$i/HomeWork/prof2_work/*
done
for i in {1..20}
do
#assigning questions prof1
#creating 5 random numbers within len
declare -a arr
var=$RANDOM
((var %= len))
if [ $var == 0 ]
then
var=$len
fi
arr[0]=$var

for il in {1..4}
do
var=$RANDOM
((var %= len))
if [ $var == 0 ]
then
var=$len
fi

f=0
for((inn=1;inn<${#arr[*]};inn++))
do
if [ $var == ${arr[$inn]} ]
then
let il--
f=1
break
fi
done
if [ $f == 0 ]
then
arr[$il]=$var
fi

done

echo ${arr[*]}

for j in {0..4}
do
#echo $j
echo ${arr[$j]}
loc=$(sed -n "${arr[$j]}"p q.txt)
sed -n "${arr[$j]}"p q.txt >c.txt
#echo $loc
dir=$(cat c.txt|sed 's/.*rial\///g'|cut -d "/" -f1)
echo $dir
sudo mkdir /home/s$i/HomeWork/prof1_work/"$dir"
sudo cp "$loc" /home/s$i/HomeWork/prof1_work/"$dir"
done

#assigning questions prof2
#creating 5 random numbers within len1
declare -a arr1
var=$RANDOM
((var %= len1))
if [ $var == 0 ]
then
var=$len1
fi
arr1[0]=$var

for ik in {1..4}
do
var=$RANDOM
((var %= len1))
if [ $var == 0 ]
then
var=$len
fi
f=0
for((inm=1;inm<${#arr1[*]};inm++))
do
if [ $var == ${arr1[$inm]} ]
then
let ik--
f=1
break
fi
done
if [ $f == 0 ]
then
arr1[$ik]=$var
fi

done

echo ${arr1[*]}

for k in {0..4}
do
#echo $k
echo ${arr1[$k]}
loc=$(sed -n "${arr1[$k]}"p p.txt)
sed -n "${arr1[$k]}"p p.txt >d.txt
#echo $loc
dir=$(cat d.txt|sed 's/.*rial\///g'|cut -d "/" -f1)
echo $dir
sudo mkdir /home/s$i/HomeWork/prof2_work/"$dir"
sudo cp "$loc" /home/s$i/HomeWork/prof2_work/"$dir"
done

done
