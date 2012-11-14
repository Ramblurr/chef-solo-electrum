#!/bin/bash
time ssh -F tmp/vagrant_ssh_config -t $HOST "sudo chef-solo -j /tmp/node.json"
