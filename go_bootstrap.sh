#!/bin/bash
time ssh -F tmp/vagrant_ssh_config -t $HOST "sudo bash /tmp/bootstrap.sh"
