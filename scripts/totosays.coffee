# Description:
#   Because we love whatever cibertoto says.
#
# Dependencies:
#   ntwitter
#
# Configuration:
#
#
# Commands:
#   hubot totosay <phrase> - Send a tweet with <phrase>.
#
# Author:
#   marsam

twitter       = require 'ntwitter'

options =
  consumer_key: process.env.TOTO_CONSUMER_KEY
  consumer_secret: process.env.TOTO_CONSUMER_SECRET
  access_token_key: process.env.TOTO_TOKEN_KEY
  access_token_secret: process.env.TOTO_TOKEN_SECRET

twit = new twitter options

module.exports = (robot) ->
  robot.respond /toto(say)? (.*)$/i, (msg) ->
    text = msg.match[2]
    twit
      .updateStatus "#{escape(text)}", (err, data) -> if err then msg.send(err) else msg.send('ok')

# vim:cuc:cc=80:
