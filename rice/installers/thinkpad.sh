#!/bin/bash

sudo add-apt-repository ppa:linrunner/tlp &&
sudo apt-get update &&

sudo apt-get install tlp tlp-rdw -y &&
sudo apt-get install tp-smapi-dkms acpi-call-dkms -y &&

systemctl enable tlp.service &&
systemctl enable tlp-sleep.service

sudo tlp start
