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
#   hubot totosays <phrase> - Update @shittotosays status with <phrase>.
#
# Author:
#   marsam

Twit       = require 'twit'

options =
  consumer_key: process.env.TOTO_CONSUMER_KEY
  consumer_secret: process.env.TOTO_CONSUMER_SECRET
  access_token_key: process.env.TOTO_TOKEN_KEY
  access_token_secret: process.env.TOTO_TOKEN_SECRET

T = new Twit options

module.exports = (robot) ->
  robot.respond /(?:shit)?toto(?:says)? (.*)$/i, (msg) ->
    status = msg.match[1]
    params =
      status: status
    T.post 'statuses/update', params, (err, reply) -> if err then msg.send(err) else msg.send('ok')
