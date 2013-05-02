#!/usr/bin/env python
# -*- coding: utf-8 -*-

from fabric.api import env
from fabric.colors import green
from fabric.decorators import task
from fabric.operations import run, sudo, put
from fabric.context_managers import cd

env.hosts = ['hansyschmitt.com']
env.user = 'marsam'

env.timeout = 120
env.forward_agent = True
env.use_ssh_config = True
env.repo = '/home/marsam/rambot'


@task(default=True)
def deploy():
    put('rambot.json', '/home/marsam/rambot.json')
    with cd(env.repo):
        # installing cookbooks with berkshelf
        run('/opt/chef/embedded/bin/berks install -b /home/marsam/rambot/deploy/Berksfile --path=cookbooks')  # nopep8
        sudo('chef-solo -c solo.rb -j /home/marsam/rambot.json')


@task
def bootstrap():
    print(green('Installing chef'))
    sudo('wget -O- "https://www.opscode.com/chef/install.sh" | bash')
    # I know this is pretty clumsy, but because we install chef trough omnibus
    # installer, I feel it reasonable
    run('/opt/chef/embedded/bin/gem install berkshelf')
