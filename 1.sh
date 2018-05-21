#!/bin/bash
umask 000
#creating hod
sudo useradd -m HOD
sudo passwd HOD
sudo chmod 770 /home/HOD

#creating profs
sudo useradd -m p1
sudo passwd p1
sudo chmod 777 /home/p1
sudo chmod g+s /home/p1
sudo mkdir /home/p1/Teaching_Material
sudo chmod 777 /home/p1/Teaching_Material
for i in {1..50}
do
head /dev/urandom | tr -dc A-Za-z0-9 | head -c 100 >/home/p1/Teaching_Material/q$i.txt
done
sudo chmod 770 /home/p1
sudo chown p1 /home/p1/Teaching_Material
sudo chgrp p1 /home/p1/Teaching_Material
sudo chmod 770 /home/p1/Teaching_Material

sudo useradd -m p2
sudo passwd p2
sudo chmod 777 /home/p2
sudo chmod g+s /home/p1
sudo mkdir /home/p2/Teaching_Material
sudo chmod 777 /home/p2/Teaching_Material
for i in {1..50}
do
head /dev/urandom | tr -dc A-Za-z0-9 | head -c 100 >/home/p2/Teaching_Material/q$i.txt
done
sudo chmod 770 /home/p2
sudo chown p2 /home/p2/Teaching_Material
sudo chgrp p2 /home/p2/Teaching_Material
sudo chmod 770 /home/p2/Teaching_Material


#creating students
for i in {1..20}
do
sudo useradd -m s$i
sudo passwd s$i
sudo chmod 770 /home/s$i
sudo chmod g+s /home/s1
sudo mkdir /home/s$i/HomeWork
sudo mkdir /home/s$i/HomeWork/prof1_work
sudo mkdir /home/s$i/HomeWork/prof2_work
sudo chown s$i /home/s$i/HomeWork
for j in {1..5}
do
var=$RANDOM
(( var %= 50))
if [ $var -eq 0 ]
then
var=50
fi
sudo cp /home/p1/Teaching_Material/q$var.txt /home/s$i/HomeWork/prof1_work 
done
for k in {1..5}
do
var=$RANDOM
(( var %= 50))
if [ $var -eq 0 ]
then
var=50
fi
sudo cp /home/p2/Teaching_Material/q$var.txt /home/s$i/HomeWork/prof2_work  
done
done

#linking HOD
sudo usermod -G p1,p2,s1,s2,s3,s4,s5 HOD

#linking profs
sudo usermod -G s1,s2,s3,s4,s5 p1
sudo usermod -G s1,s2,s3,s4,s5 p2


