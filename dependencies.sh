#!/bin/bash
# some dependencies

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y curl wget software-properties-common build-essential libyaml-dev libssl-dev libgdbm-dev \
		libncurses5-dev libpq-dev libffi-dev make gcc g++ autoconf bison libyaml-dev libreadline7  \
		libreadline-dev zlib1g zlib1g-dev openssl libssl-dev libssl-dev libyaml-dev
