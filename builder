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
  npm install -g hubot
fi

# Creating hubot ##############################################################

echo "Creating $HUBOT"
hubot --create $HUBOT_DIR

mv $CODEROOT/scripts/* $HUBOT_DIR/scripts

# Installing dependencies #####################################################

(
  cd $HUBOT_DIR
  npm update
  npm install hubot-irc
  npm install ntwitter
  npm install underscore
)

chmod +x $HUBOT_DIR/bin/hubot

# Configuring hubot ###########################################################

cat > ~/profile << EOF
## Redis Stuff
export REDISTOGO_URL=\$DOTCLOUD_DATA_REDIS_URL
export PORT=\$PORT_HUBOT

## hubot-irc stuff
export HUBOT_IRC_SERVER="irc.freenode.net"
# export HUBOT_IRC_ROOMS=""
export HUBOT_IRC_PASSWORD=""
export HUBOT_IRC_NICK="$HUBOT"
export HUBOT_IRC_UNFLOOD="false"
# export HUBOT_LOG_LEVEL="debug"  # This helps to see what Hubot is doing
# export HUBOT_IRC_DEBUG="true"

EOF

cat > ~/run << EOF
#!/bin/sh

cd $HUBOT_DIR
exec bin/hubot --adapter irc --name $HUBOT --alias '/'
EOF

chmod +x ~/run

echo "Have fun!!!"

# vim:ft=sh:tw=79:
