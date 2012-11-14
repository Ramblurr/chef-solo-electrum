#!/bin/sh
scp -F tmp/vagrant_ssh_config -r bootstrap.sh node*.json roles/ data_bags/ tmp/cookbooks $HOST:/tmp
