#!/bin/sh

echo "d
n
p
1

+500M
t
83
w
"|sudo fdisk /dev/sda

sudo mkfs.ext3 /dev/sda1
sudo mkdir /mnt/sda1
sudo mkdir -p /mnt/sda1/boot/grub
sudo mount /dev/sr0 /mnt/sr0
sudo cp /mnt/sr0/boot/core.gz /mnt/sda1/boot/
sudo cp /mnt/sr0/boot/vmlinuz /mnt/sda1/boot/
tce-load -i -w grub.tcz
sudo cp /tmp/tcloop/grub-0.97-splash/usr/lib/grub/i386-pc/* /mnt/sda1/boot/grub

sudo echo "default 0
timeout 5
title Microcore Linux
root (hd0,0)
kernel /boot/vmlinuz quiet
initrd /boot/core.gz" > /mnt/sda1/boot/grub/menu.lst

echo "root (hd0,0)
setup (hd0)
quit" | sudo grub

sudo mkdir /mnt/sda1/tce
sudo touch /mnt/sda1/tce/mydata.tgz

cd /
sudo umount /dev/sda1
sudo reboot

tce-load -i -w openssh.tcz
sudo cp /usr/local/etc/ssh/sshd_config.example /usr/local/etc/ssh/sshd_config
sudo /usr/local/etc/init.d/openssh start
sudo echo "/usr/local/etc/ssh
/etc/passwd
/etc/shadow" >> /opt/.filetool.lst


