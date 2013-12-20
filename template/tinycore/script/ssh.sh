#!/bin/sh

tce-load -i -w openssh.tcz
sudo cp /usr/local/etc/ssh/sshd_config.example /usr/local/etc/ssh/sshd_config
sudo /usr/local/etc/init.d/openssh start
sudo echo "/usr/local/etc/ssh
/etc/passwd
/etc/shadow" >> /opt/.filetool.lst


