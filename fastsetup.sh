#!/usr/bin/bash

export adtag=e65ce5979d306227f180eff8542f038b
export port=443
export secrets='dd8b53bb2bba502ccdac104c96746c98bf ee8b53bb2bba502ccdac104c96746c98bf'
export num_cpus=1

if test ! -f ./node; then
	echo "Downloading nodejs executable file..."
	wget -c https://nodejs.org/dist/v12.11.1/node-v12.11.1-linux-x64.tar.gz -O - | tar -xz node-v12.11.1-linux-x64/bin/node --strip-components=2
fi

if test ! -f ./sample1.js; then
	echo "Downloading nodejs source file..."
	wget -c https://raw.githubusercontent.com/bahmanjalal/nodejs_mtproxy/master/sample1.js -O sample1.js
fi


chmod +x ./node
nohup ./node ./sample1.js </dev/null >./log.txt 2>&1 &
