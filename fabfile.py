# -*- coding: utf-8 *-

import json

from fabric.colors import green
from fabric.decorators import task
from fabric.operations import local


@task(default=True)
def deploy():
    print green('Deploying to dotcloud... ')
    local('dotcloud push rambot')
    print green('Setting ennvironment variables...')
    with open('private.environment.json') as f:
        env = json.load(f)
        for var, value in env.iteritems():
            local('dotcloud var set %s=%s' % (var, value))
    print green('Have fun!!!')
