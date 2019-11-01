#!/usr/bin/env bash

systemctl stop replicated replicated-operator replicated-ui
service docker stop

rm -rf /var/lib/replicated /var/lib/replicated-operator /etc/replicated.alias /var/lib/tfe-vault/ /etc/default/replicated-operator /etc/default/replicated 

rm -fr /var/lib/docker

service docker start

docker ps -a
