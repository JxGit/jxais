#!/bin/bash

#-------------------------------------------------------------------------------
# Created by Jerry Jianrui Xu: jerryjianruixu[at]gmail[dot]com
#-------------------------------------------------------------------------------

device=$1

gpttbl="mktable gpt"                          # create an empty GPT partition table on /dev/sda
p1="mkpart linux ---- 17.4KB 2MB"             # create a 2MB linux partition #1 {1st 17.4KB (34 x 512 =17408 sectors) used by parted for its data}
p1set="set 1 bios_grub on"                    # set partition #1 with the GRUB2 (core.img) stage2 bootcode (ef02)
p2="mkpart mkpart linux ext2 2MB 500MB"       # create a linux partition #2
p2set="set 2 boot on"                         # set partition #2 with the boot flag (ef00)
p3="mkpart linux ext2 500MB 200GB"            # create a linux partition #3
p4="mkpart swap linux-swap 200GB 208GB"       # create a linux partition #4
p5="mkpart linux ext2 208GB 220GB"            # create a linux partition #5
p6="mkpart linux ext2 220GB 100%"             # partition remaining disk space as linux partition #6

sudo parted --align optimal --script $device ${gpttbl} ${p1} ${p1set} ${p2} ${p2set} ${p3} ${p4} ${p5} ${p6}




