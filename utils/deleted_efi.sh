#!/bin/bash
# this could solve your problem too: https://unix.stackexchange.com/questions/167893/restore-efi-boot-partition

sudo mount /dev/$1 /mnt

for i in  /dev  /dev/pts  /proc  /sys  /run; do sudo mount -B $i  /mnt$i; done

sudo chroot /mnt

mkdir -p /boot/efi

mount /dev/$2 /boot/efi

apt install efibootmgr
grub-install /dev/$2

update-grub

exit

reboot

# second solution
sudo mount /dev/$1 /mnt
sudo mount /dev/$2 /mnt/boot/efi

chroot /mnt/boot/efi

apt-cdromm update

apt-get install --reinstall grub-efi
apt-get install --reinstall grub-efi-amd64

grub-install /dev/$2

update-grub

efibootmgr --verbose | grep ubuntu
