#!/usr/bin/env python
# -*- coding: utf-8 -*-

from fabric.api import env
from fabric.decorators import task
from fabric.operations import run, sudo, put
from fabric.context_managers import cd

env.hosts = ['hansyschmitt.com']
env.user = 'marsam'

env.timeout = 120
env.forward_agent = True
env.use_ssh_config = True
env.workdir = '/opt/rambot'


@task(default=True)
def deploy():
    with cd(env.workdir):
        put('rambot.private.json', 'rambot.private.json')
        run('git pull --rebase')
        # -b Berksfile needs to be absolute path
        run('/opt/chef/embedded/bin/berks install -b %s/deploy/Berksfile --path=cookbooks' % env.workdir)  # nopep8
        sudo('chef-solo -c solo.rb -j rambot.private.json')


@task
def bootstrap():
    sudo('apt-get install -y libxml2-dev libxslt1-dev')
    sudo('wget -O- "https://www.opscode.com/chef/install.sh" | bash')
    sudo('/opt/chef/embedded/bin/gem install berkshelf')
