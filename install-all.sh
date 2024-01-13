#!/bin/bash

sudo apt install -y curl wget;

set -e
for f in ./installers/*.sh; do
  bash "$f"
done

sh ohmyzsh-install.sh