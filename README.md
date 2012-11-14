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

Create data_bags/electrum/passwords.json with the contents:

    {
        "id": "passwords",
        "bitcoind" : {
            "rpcuser": "A USER NAME",
            "rpcpass": "A PASSWORD"
        }
    }

Export the name of the node:

    export HOST=electrum

Update files:

    ./go_files.sh

Bootstrap the node:

    ./go_bootstrap.sh

Run Chef in the _solo_ mode:

    ./go_chef.sh

Electrum should be installed on your node. To develop+debug, edit files, then
repeat update/bootstrap/run chef

## Deploy to EC2

To be written...
