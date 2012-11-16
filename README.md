# Chef Solo: Electrum Server

A chef-solo setup for an [electrum server(https://github.com/spesmilo/electrum-server).

You need:

* A working Ruby and Rubygems support
* * [Vagrant](http://vagrantup.com) for [Virtual Box](https://www.virtualbox.org)
* * [Git](http://git-scm.com)
* * [Berkshelf](http://berkshelf.com) Rubygem

## Setup

First, launch the virtual machine with Vagrant:

    vagrant up

Then, download the required cookbooks

    berks install -p tmp/cookbooks

Generate configuration for connecting to the machine via SSH:

    vagrant ssh-config > tmp/vagrant_ssh_config

Copy `data_bags.sample` to `data_bags` and edit to your preference

Export the name of the node:

    export HOST=electrum

Run Chef in the _solo_ mode:

    ./go_vagrant.sh

Electrum should be installed on your node.

## Deploy to EC2

To be written...
