gcloud compute firewall-rules create default-puma-server --allow tcp:9292 \
  --description "Allow incoming traffic on TCP port 9292 (puma server)" \
  --source-ranges="0.0.0.0/0" \
  --target-tags="puma-server" \
  --direction INGRESS

Убрать проверку на хост

~/.ssh/config
Host bastion
    HostName 35.233.72.169
    User ubuntu

Host someinternalhost 10.132.0.28
    User ubuntu
    ProxyCommand ssh -i ~/.ssh/ubuntu -A bastion nc -w 180 %h %p% 


    

Посмотреть что получилось
    terraform show

Скачать скрипт
    curl https://gist.githubusercontent.com/Nklya/df07e99e63e4043e6a699060a7e30b66/raw/d5d572755ea811ac7d4e1b7b47d5f0c9527693b3/setupvpn.sh | bash


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

