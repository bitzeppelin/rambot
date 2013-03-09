#!/bin/sh

HUBOT=${SERVICE_HUBOT_NAME:="hubot"}
HUBOT_DIR=$HOME/$HUBOT
CODEROOT=$PWD

node_root=/opt/node


# Installing node.js ##########################################################
# From https://github.com/dotcloud/node-on-dotcloud
[ "$SERVICE_NODE_VERSION" ] &&
[ "$SERVICE_NODE_VERSION" != "$(node --version)" ] &&
(
    rm -rf $node_root/*
    cd $node_root
    curl -L https://github.com/joyent/node/tarball/$SERVICE_NODE_VERSION | tar -zxf-
    cd joyent-node-*
    ./configure --prefix=$node_root
    make
    make install
)


# Installing hubot ############################################################

echo "Installing hubot"
npm install -g coffee-script

if [ -n "$SERVICE_HUBOT_VERSION" ]; then
  npm install -g hubot@$SERVICE_HUBOT_VERSION
else
  npm install -g git+https://github.com/github/hubot.git
fi

# Creating hubot ##############################################################
if [ ! -d $HUBOT_DIR ]; then
  echo "Creating $HUBOT"
  hubot --create $HUBOT_DIR
  chmod +x $HUBOT_DIR/bin/hubot
fi

# Installing dependencies #####################################################
# You can add your hubot dependencies below, this behaves same way that adding
# the packages to package.json
(
  cd $HUBOT_DIR
  npm update
  npm install hubot-irc
  npm install twit
  npm install underscore
)


mv $CODEROOT/scripts/* $HUBOT_DIR/scripts

# Configuring hubot ###########################################################

cat > ~/profile << EOF
## Redis Stuff
export REDISTOGO_URL=\$DOTCLOUD_BRAIN_REDIS_URL
export PORT=\$PORT_HUBOT
EOF

cat > ~/run << EOF
#!/bin/sh

cd $HUBOT_DIR
exec bin/hubot --adapter irc --name $HUBOT --alias '!'
EOF

chmod +x ~/run

echo "Have fun!!!"

# vim:ft=sh:tw=79:
