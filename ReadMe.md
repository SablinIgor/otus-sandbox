gcloud compute firewall-rules create default-puma-server --allow tcp:9292 \
  --description "Allow incoming traffic on TCP port 9292 (puma server)" \
  --source-ranges="0.0.0.0/0" \
  --target-tags="puma-server" \
  --direction INGRESS


#!/bin/bash

rubyVersion=$(ruby -v 2>&1 | grep -Po '(?<=ruby )(.+)')

if [[ -z "$rubyVersion" ]]
then
  echo "No ruby instalation found!"
  exit 1
else
  echo "Ruby version is $rubyVersion"
fi

bundlerVersion=$(bundler -v 2>&1 | grep -Po '(?<=Bundler version )(.+)')

if [[ -z "$bundlerVersion" ]]
then
  echo "No bundler instalation found!"
  exit 1
else
  echo "Bundler version is $bundlerVersion"
fi