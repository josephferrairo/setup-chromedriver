#!/bin/bash

set -eo pipefail

version=$1
arch=$2

sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

sudo apt-get install -y xvfb screen google-chrome-stable

wget -c -nc --retry-connrefused --tries=0 https://chromedriver.storage.googleapis.com/${version}/chromedriver_${arch}.zip
unzip -o -q chromedriver_${arch}.zip
sudo mv chromedriver /usr/local/bin/chromedriver
