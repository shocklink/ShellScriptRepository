#!/bin/sh
echo link laptop
#sshfs gengyou@10.116.61.9:/ sshfs-gengyou-laptop/ -p 22
echo link i7-2
#sshfs kernel-team2@10.116.57.221:/ sshfs-kernelteam2-i7-2/ -p 22
echo link i7-ics
#sshfs ics@10.116.59.72:/ sshfs-i7-ics/ -p 22
echo link itwn SVB code
sshfs kenlin@twsxeris003.itwn.intel.com:/local/kenlin sofia_itwn_sshfs/
