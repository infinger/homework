#!/bin/bash

parted -s /dev/md0 \
		mklabel gpt \
		unit mib 

parted -s /dev/md0 mkpart primary 1 3
parted -s /dev/md0 name 1 bios
parted -s /dev/md0 set 1 bios_grub on 
parted -s /dev/md0 mkpart primary 3 259 
parted -s /dev/md0 name 2 boot 
parted -s /dev/md0 mkpart primary 259 550 
parted -s /dev/md0 name 3 swap 
parted -s /dev/md0 mkpart primary 550 650 
parted -s /dev/md0 mkpart primary 650 750
