#!/bin/bash

umask 000
#creating hod
sudo useradd -m HOD
sudo usermod -p "p" HOD
sudo chmod 770 /home/HOD

#creating profs
sudo useradd -m p1
sudo usermod -p "p" p1
sudo chmod 777 /home/p1
sudo chmod g+s /home/p1
sudo chmod u+s /home/p1
sudo mkdir /home/p1/Teaching_Material
sudo chmod 777 /home/p1/Teaching_Material
sudo ./6.sh
sudo chmod 770 /home/p1
sudo chown p1 /home/p1/Teaching_Material
sudo chgrp p1 /home/p1/Teaching_Material
sudo chmod 770 /home/p1/Teaching_Material

sudo useradd -m p2
sudo usermod -p "p" p2
sudo chmod 777 /home/p2
sudo chmod g+s /home/p2
sudo chmod u+s /home/p2
sudo mkdir /home/p2/Teaching_Material
sudo chmod 777 /home/p2/Teaching_Material
sudo ./7.sh
sudo chmod 770 /home/p2
sudo chown p2 /home/p2/Teaching_Material
sudo chgrp p2 /home/p2/Teaching_Material
sudo chmod 770 /home/p2/Teaching_Material

#creating students
sudo find /home/p1/Teaching_Material -type f > q.txt #part of next segment
len=$(wc -l < q.txt)
echo len= $len
sudo find /home/p2/Teaching_Material -type f > p.txt 
len1=$(wc -l < p.txt) 
echo len= $len1 # till here

for i in {1..20}
do
sudo useradd -m s$i
sudo usermod -p "p" s$i
sudo chmod 770 /home/s$i
sudo chmod g+s /home/s$i
sudo mkdir /home/s$i/HomeWork
sudo mkdir /home/s$i/HomeWork/prof1_work
sudo mkdir /home/s$i/HomeWork/prof2_work
sudo chown s$i /home/s$i/HomeWork

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

#linking HOD
sudo usermod -G p1,p2,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20 HOD

#linking profs
sudo usermod -G s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20 p1
sudo usermod -G s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20 p2

rm -r p.txt
rm -r q.txt
rm -r c.txt
rm -r d.txt



