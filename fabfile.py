#!/usr/bin/env python
# -*- coding: utf-8 -*-

from fabric.api import env
from fabric.colors import green
from fabric.operations import run, sudo, put
from fabric.decorators import task

env.hosts = ['hansyschmitt.com']
env.user = 'marsam'

env.timeout = 120
env.forward_agent = True
env.use_ssh_config = True


@task(default=True)
def whoami():
    run('whoami')
    put('deploy', '/tmp/cookbooks')


@task
def bootstrap():
    print(green('Installing chef'))
    sudo('wget -O- "https://www.opscode.com/chef/install.sh" | bash')
