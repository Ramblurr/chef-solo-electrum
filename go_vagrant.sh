#!/bin/sh
scp -F tmp/vagrant_ssh_config -r bootstrap.sh node*.json roles/ data_bags/ tmp/cookbooks $HOST:/tmp
#!/bin/bash
time ssh -F tmp/vagrant_ssh_config -t $HOST "sudo bash /tmp/bootstrap.sh"
#!/bin/bash
time ssh -F tmp/vagrant_ssh_config -t $HOST "sudo chef-solo -j /tmp/node.json"
