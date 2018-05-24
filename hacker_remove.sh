#!/bin/bash

#removing hod
sudo userdel HOD
sudo rm -r /home/HOD

#deleting profs
sudo userdel p1
sudo rm -r /home/p1

sudo userdel p2
sudo rm -r /home/p2

#deleting students
for i in {1..20}
do
sudo userdel s$i
sudo rm -r /home/s$i
done

