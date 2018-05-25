# delta_sys_ad
normal.sh -> to do the normal mode of task1 <br>
normal_remove.sh -> to unravel changes made by normal.sh<br><br>
hacker.sh -> to do the hacker mode of task1 <br>
hacker_remove.sh -> to unravel changes made by hacker.sh<br><br>
6.sh,7.sh are scripts required by hacker mode to run.<br>
algorithm.txt, dataStructure.txt required to provide input for hackermode<br><br>

crontable to be set 00 17 * * 1-6 /path/to/create_hw<br>
create_hw.sh deletes old hw and assigns new hw everyday at 5 pm except sunday
