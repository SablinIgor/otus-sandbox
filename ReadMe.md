One line: ssh -At -i ~/.ssh/ubuntu -A ubuntu@35.233.72.169 ssh 10.132.0.3

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

