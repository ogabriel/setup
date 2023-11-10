#!/usr/bin/env bash

asdf plugin add crystal
asdf plugin update crystal

VERSION=${1:-$(asdf latest crystal)}

asdf install crystal $VERSION
asdf global crystal $VERSION
