# -*- coding: utf-8 *-

import os
import json

from fabric.colors import green
from fabric.decorators import task
from fabric.operations import local


@task(default=True)
def deploy():
    local('dotcloud push rambot')
    print green('Have fun!!!')


@task()
def envvars():
    if os.path.isfile('private.environment.json'):
        with open('private.environment.json') as f:
            env = json.load(f)
            envvars = ' '.join('%s="%s"' % (i, j) for i, j in env.iteritems())
            local('dotcloud var set rambot %s' % envvars)
