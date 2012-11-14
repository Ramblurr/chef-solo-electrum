# Install cookbooks with:
#
#     $ berks install --shims ./tmp/cookbooks
#
# Pre-requisites:
#
# * The [`gecode`](http://www.gecode.org) library  : $ brew install gecode
# * The [`berkshelf`](http://berkshelf.com) gem    : $ gem install berkshelf

cookbook 'build-essential'
cookbook 'postgresql'
cookbook 'python'
cookbook 'git'
cookbook 'chef-user', git: 'https://github.com/fnichol/chef-user.git'
cookbook 'bitcoin-abe', path: '~/src/chef/bitcoin-abe'
cookbook 'electrum', path: '~/src/chef/electrum'
