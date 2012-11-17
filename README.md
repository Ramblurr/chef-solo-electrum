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

Run Chef in solo mode:

    ./go_vagrant.sh

Electrum should be installed on your local VM.

### SSL configuration

Generate your self-signed TLS certs using your favorite TLS implemenation, or
buy into the racket and have someone else sign your cert.

You need to convert your certificate, private keys, and CA bundles into
single-line blobs with literal \n characters. This is so it may be copy/pasted
into your data bag. You can use a Perl or Ruby one-liner for this conversion.
(from
[atomic-penguin/cookbook-certificate](https://github.com/atomic-penguin/cookbook-certificate)

    /usr/bin/env ruby -e 'p ARGF.read' <filename>
    -OR-
    perl -pe 's!(\x0d)?\x0a!\\n!g' <filename>


### Deploy to EC2

To be written...

## After Deploying

(Optionally) fetch the blockchain bootstrap

    # if you care about security you should check sig of this file
    # visit http://eu2.bitcoincharts.com/blockchain/
    sudo wget http://eu2.bitcoincharts.com/blockchain/bootstrap.dat -O /home/bitcoin/.bitcoin

Start bitcoind

    sudo /etc/init.d/bitcoind start

Wait for hell to freeze over while the fat lady sings the blockchain home again.

Start electrum

    sudo /etc/init.d/electrum start

Other things you should do:

* Remove chef + ruby + chef user (that NOPASSWD account, tsk tsk)
* Firewall up
* Lockdown


## Upgrading

TODO: Figure this out

Naive, not good way:

    cd /usr/local/src/electrum
    git pull origin master
    sudo /etc/init.d/electrum restart
