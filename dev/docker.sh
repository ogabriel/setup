#!/bin/bash

sudo pacman -S docker --noconfirm
sudo systemctl enable docker.service
sudo usermod -aG docker $USER
